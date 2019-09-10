#docker run -it --rm  -v $PWD:/etc/redis -v $PWD/datadir:/data  redis:alpine3.10 redis-server /etc/redis/redis.conf
./buildDocker.sh

runDockerHub(){
    runTestStr="docker run -it --rm  -v $PWD/conf:/etc/redis -p 6379:6379 redis:alpine3.10 redis-server /etc/redis/redis.conf" 
    runStr="docker run -d -v $PWD/conf:/etc/redis -p 6379:6379 redis:alpine3.10 redis-server /etc/redis/redis.conf" 
    echo $runStr
    $runStr
}
tagName=`cat tag`
runStr="docker run --rm -it --env REDIS_PWD=123456 $tagName"
echo $runStr
$runStr
#docker run --rm -it --env REDIS_PWD=123456 $tagName
