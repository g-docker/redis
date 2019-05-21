tagName='registry.cn-beijing.aliyuncs.com/w_docker/redis:2.0.1'

docker build -t  $tagName --no-cache .
docker push  $tagName
