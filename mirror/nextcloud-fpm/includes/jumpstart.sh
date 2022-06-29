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
run_as "php /var/www/html/occ app:install notify_push"

echo "Waiting for HPB-Container to start..."
until [ -f /var/www/html/REQHPB ]
do
     sleep 10
     echo "HPB-Container not found... waiting..."
done
echo  "HPB-Container found!"
echo  "Waiting for 20 seconds before High Performance Backend setup..."
sleep 20
echo  "Configuring High Performance Backend for url: ${ACCESS_URL}"
run_as "php /var/www/html/occ notify_push:setup ${ACCESS_URL}/push
rm -f /var/www/html/REQHPB

exec "$@"
