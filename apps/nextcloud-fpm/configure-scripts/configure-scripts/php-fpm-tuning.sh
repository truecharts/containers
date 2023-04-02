#!/bin/bash
tune_fpm_install() {
  echo '## Applying PHP-FPM Tuning...'
  echo "PHP_MAX_CHILDREN:       ${NX_PHP_MAX_CHILDREN:-20}"
  echo "PHP_START_SERVERS:      ${NX_PHP_START_SERVERS:-5}"
  echo "PHP_MIN_SPARE_SERVERS:  ${NX_PHP_MIN_SPARE_SERVERS:-5}"
  echo "PHP_MAX_SPARE_SERVERS:  ${NX_PHP_MAX_SPARE_SERVERS:-15}"
  echo ''
  echo 'Visit https://spot13.com/pmcalculator to see what values you should set'

  tune_file="/usr/local/etc/php-fpm.d/zz-tune.conf"

  {
    echo '[www]'
    echo "pm.max_children = ${NX_PHP_MAX_CHILDREN:-20}"
    echo "pm.start_servers = ${NX_PHP_START_SERVERS:-5}"
    echo "pm.min_spare_servers = ${NX_PHP_MIN_SPARE_SERVERS:-5}"
    echo "pm.max_spare_servers = ${NX_PHP_MAX_SPARE_SERVERS:-15}"
  } > "$tune_file"

  if [ -f "$tune_file" ] && [ -s "$tune_file" ]; then
    echo 'Tune file created!'
  else
    echo 'Tune file failed to create.'
  fi
}

tune_fpm_remove() {
  echo '## Removing PHP-FPM Tuning...'

  tune_file="/usr/local/etc/php-fpm.d/zz-tune.conf"

  if [ -f "$tune_file" ]; then
    echo '' > "$tune_file"
  fi

  if [ -f "$tune_file" ] && [ ! -s "$tune_file" ]; then
    echo 'Tune file cleaned!'
  else
    echo 'Tune file failed to clean.'
  fi
}
