#!/bin/sh

if [ -n "${NEXTCLOUD_TRUSTED_DOMAINS+x}" ]; then
    echo "Setting trusted domains…"
    NC_TRUSTED_DOMAIN_IDX=1
    for DOMAIN in $NEXTCLOUD_TRUSTED_DOMAINS ; do
        DOMAIN=$(echo "$DOMAIN" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        run_as "php /var/www/html/occ config:system:set trusted_domains $NC_TRUSTED_DOMAIN_IDX --value=$DOMAIN"
        NC_TRUSTED_DOMAIN_IDX=$(($NC_TRUSTED_DOMAIN_IDX+1))
    done
fi

echo "Disabling Data-Dir permission checks…"
run_as "php /var/www/html/occ config:system:set check_data_directory_permissions --value=false"


exec "$@"
