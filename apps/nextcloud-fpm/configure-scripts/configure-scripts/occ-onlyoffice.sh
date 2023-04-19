occ_onlyoffice_install() {
  echo '## Configuring OnlyOffice...'
  install_app onlyoffice

  occ config:app:set onlyoffice DocumentServerUrl --value="${NX_ONLYOFFICE_URL:?"NX_ONLYOFFICE_URL is unset"}"
  occ config:system:set onlyoffice jwt_secret --value="${NX_ONLYOFFICE_JWT:?"NX_ONLYOFFICE_JWT is unset"}"
  occ config:system:set onlyoffice jwt_header --value="${NX_ONLYOFFICE_JWT_HEADER:-"Authorization"}"
}

occ_onlyoffice_remove() {
  echo '## Removing OnlyOffice Configuration...'
  remove_app onlyoffice

  occ config:app:delete onlyoffice DocumentServerUrl
  occ config:system:delete onlyoffice jwt_secret
  occ config:system:delete onlyoffice jwt_header
}
