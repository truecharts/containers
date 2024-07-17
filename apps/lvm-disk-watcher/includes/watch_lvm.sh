#!/bin/bash
set -e

config_file="/config/disk-config"
node_name="${NODE_NAME}"
last_modified=""

while true; do
  # Function to list all disks
  list_disks() {
    echo "Executing list_disks function..."
    lsblk -dno NAME,TYPE || echo "lsblk command failed with exit code $?"
  }

  # Check if the configuration file has been modified
  current_modified=$(stat -c %Y "$config_file" 2>/dev/null || echo "")
  if [ "$current_modified" != "$last_modified" ]; then
    echo "Config file modified. Updating LVM setup."
    last_modified="$current_modified"

    # Print current PVs and VGs
    echo "Current Physical Volumes:"
    pvscan
    echo "Current Volume Groups:"
    vgs

    # Print list of disks
    list_disks

    # Clear existing LVM setup (if necessary)
    # Example: vgremove -y vg_${node_name}
    # Example: pvremove -y /dev/sdX

    # Read configuration for the current node
    if [ -f "$config_file" ]; then
      echo "Config file found, contents:"
      cat "$config_file"
      # Fetch disks to watch for the current node
      watch_disks=$(grep "^$node_name:" "$config_file" | cut -d ':' -f 2- | xargs)

      echo "Configuration found for node $node_name: $watch_disks"

      if [ -z "$watch_disks" ]; then
        echo "No configuration found for node $node_name. Sleeping."
      elif [ "$watch_disks" == "all" ]; then
        echo "All disks configured for node $node_name."
        watch_disks=$(lsblk -dno NAME,TYPE | grep -v -E 'loop|rom|raid|dm|crypt|tape|usb|floppy|bcm2835_sdhost' | awk '$2=="disk" {print "/dev/" $1}')
      elif [ "$watch_disks" == "none" ]; then
        echo "No disks configured for node $node_name. Sleeping."
        watch_disks=""
      fi

      # Process each disk configuration for the node
      for disk in $watch_disks; do
        # Check if the disk is empty
        if ! lsblk -n "$disk" | grep -q part; then
          echo "Disk $disk is empty. Setting up LVM."

          # Create LVM PV
          pvcreate "$disk"

          # Create VG with the disk name (remove /dev/ prefix)
          vgcreate "vg_${disk#/dev/}" "$disk"
          vgcreate "topolvm_all" "$disk"
        else
          echo "Disk $disk is not empty. Skipping."
        fi
      done
    else
      echo "Configuration file not found. Exiting."
      exit 1
    fi
  fi

  sleep 60  # Sleep for 1 minute before checking again
done