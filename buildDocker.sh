#!/bin/bash
tag="5.0.5"
image='ccr.ccs.tencentyun.com/g-docker/redis'
tagName=$image:$tag
echo $tagName > tag
isExist="docker images | grep $image| grep $tag"
echo $isExist
`docker images |grep $image| grep $tag`
if [ $? == 1 -o $1 == "-f" ];then
  echo "build image ...."
  docker build -t $tagName --no-cache .
  docker push $tagName
else
  echo "image is exist"
fi
