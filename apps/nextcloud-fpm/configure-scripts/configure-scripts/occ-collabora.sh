occ_collabora_install() {
  echo '## Configuring Collabora...'
  install_app richdocuments

  occ config:app:set richdocuments wopi_url --value="${NX_COLLABORA_URL:?"NX_COLLABORA_URL is unset"}"
  occ config:system:set allow_local_remote_servers --value="true"
}

occ_collabora_remove() {
  echo '## Removing Collabora Configuration...'
  remove_app richdocuments

  occ config:app:delete richdocuments wopi_url
  occ config:system:delete allow_local_remote_servers
}
