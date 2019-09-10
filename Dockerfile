FROM  redis:alpine3.10
MAINTAINER gw123  <963353840@qq.com>

COPY ./conf/redis.conf /data/redis.tpl.conf
COPY docker-entrypoint.sh /usr/local/bin/
ENTRYPOINT ["docker-entrypoint.sh"]

EXPOSE 6379
CMD ["redis-server","/data/redis.conf"]
