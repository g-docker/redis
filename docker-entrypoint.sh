#!/bin/sh
set -e

if [ $REDIS_PWD == "" ]; then
 REDIS_PWD=redis123456
fi
str="sed 's/REDIS_PWD/'$REDIS_PWD'/g' /data/redis.tpl.conf > /data/redis.conf"
echo $str
sed 's/REDIS_PWD/'$REDIS_PWD'/g' /data/redis.tpl.conf > /data/redis.conf

# first arg is `-f` or `--some-option`
# or first arg is `something.conf`
if [ "${1#-}" != "$1" ] || [ "${1%.conf}" != "$1" ]; then
	set -- redis-server "$@"
fi

# allow the container to be started with `--user`
if [ "$1" = 'redis-server' -a "$(id -u)" = '0' ]; then
	find . \! -user redis -exec chown redis '{}' +
	exec su-exec redis "$1" "$2"
fi

exec "$@"