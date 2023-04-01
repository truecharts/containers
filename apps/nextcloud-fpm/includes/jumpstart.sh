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

echo 'Applying PHP-FPM Tuning...'
echo 'You can change default values with the following variables'
echo "PHP_MAX_CHILDREN      (Default: 20) Current: ${PHP_MAX_CHILDREN:-20}"
echo "PHP_START_SERVERS     (Default:  5) Current: ${PHP_START_SERVERS:-5}"
echo "PHP_MIN_SPARE_SERVERS (Default:  5) Current: ${PHP_MIN_SPARE_SERVERS:-5}"
echo "PHP_MAX_SPARE_SERVERS (Default: 15) Current: ${PHP_MAX_SPARE_SERVERS:-15}"
echo ''
echo 'Visit https://spot13.com/pmcalculator to see what values you should set'

tune_file="/usr/local/etc/php-fpm/99-tune.conf"

{
  echo '[www]'
  echo "pm.max_children = ${PHP_MAX_CHILDREN:-20}"
  echo "pm.start_servers = ${PHP_START_SERVERS:-5}"
  echo "pm.min_spare_servers = ${PHP_MIN_SPARE_SERVERS:-5}"
  echo "pm.max_spare_servers = ${PHP_MAX_SPARE_SERVERS:-15}"
} > "$tune_file"

echo "Tune file created ($tune_file):"
echo ''
cat $tune_file

exec "$@"
