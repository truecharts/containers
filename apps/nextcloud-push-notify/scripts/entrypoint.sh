#!/bin/ash

[ -n "${NEXTCLOUD_URL:?"WARN: NEXTCLOUD_URL is unset"}" ]

HPB_HOST="${HPB_HOST:-kube.internal.healthcheck}"

until curl -k -s -H "Host: $HPB_HOST" "$NEXTCLOUD_URL/status.php" | grep -q '"installed":true'; do
  echo 'Waiting Nextcloud to be installed and ready. Sleeping for 3s...'
  sleep 3
done

if [ -n "${CONFIG_FILE:-}" ]; then
  notify_push "$CONFIG_FILE"
else
  notify_push
fi
