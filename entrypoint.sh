#!/bin/sh

# Figure out which pool is backup (opposite of active)
if [ "$ACTIVE_POOL" = "blue" ]; then
    BACKUP_POOL="green"
else
    BACKUP_POOL="blue"
fi

# Replace variables in template
envsubst '${ACTIVE_POOL} ${BACKUP_POOL}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Start nginx
exec nginx -g 'daemon off;'
