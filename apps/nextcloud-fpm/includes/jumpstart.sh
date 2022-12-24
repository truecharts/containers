#!/bin/sh

if [ -n "${NEXTCLOUD_TRUSTED_DOMAINS+x}" ]; then
    echo "ReSetting trusted domains…"
    NC_TRUSTED_DOMAIN_IDX=1
    for DOMAIN in $NEXTCLOUD_TRUSTED_DOMAINS ; do
        DOMAIN=$(echo "$DOMAIN" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')
        run_as "php /var/www/html/occ config:system:set trusted_domains $NC_TRUSTED_DOMAIN_IDX --value=$DOMAIN"
        NC_TRUSTED_DOMAIN_IDX=$(($NC_TRUSTED_DOMAIN_IDX+1))
    done
fi


if [ -n "${NEXTCLOUD_CHUNKSIZE+x}" ]; then
    run_as "php /var/www/html/occ config:app:set files max_chunk_size --value ${NEXTCLOUD_CHUNKSIZE}"
fi

[ -f /var/www/html/custom_apps/notify_push/bin/x86_64/notify_push ] && echo "Error installing notify_push already seems to be installed..." || run_as "php /var/www/html/occ app:install notify_push"
[ -f /var/www/html/custom_apps/previewgenerator/LICENSE ] && echo "Error installing previewgenerator already seems to be installed..." || run_as "php /var/www/html/occ app:install previewgenerator"

exec "$@"
