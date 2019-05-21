FROM registry.cn-beijing.aliyuncs.com/w_docker/alpine 
#FROM  registry.cn-hangzhou.aliyuncs.com/w_docker/alpine:3.8
MAINTAINER gw123  <963353840@qq.com>
COPY ./redis.conf /etc/redis/redis.conf
RUN apk add redis && rm -f /var/cache/apk/*

EXPOSE 6379
#CMD /startup1.sh
ENTRYPOINT ["redis-server","/etc/redis/redis.conf"]
