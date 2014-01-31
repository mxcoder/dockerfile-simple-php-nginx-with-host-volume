#!/bin/bash

# restart services
/etc/init.d/nginx restart
/etc/init.d/php5-fpm restart

# needed so the daemon keeps running, can be changed for any other long-running process
tail -f /var/log/nginx/error.log
