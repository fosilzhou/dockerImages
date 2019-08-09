#!/bin/bash

for imagepath in $(cat ./imagepath.txt)
do
  imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
  docker pull $imagepath

  # push到阿里云仓库
  docker tag $imagepath registry.cn-shenzhen.aliyuncs.com/fosilzhou/$imagename
  docker push registry.cn-shenzhen.aliyuncs.com/fosilzhou/$imagename

  # push到dockerhub
  docker tag $imagepath fosilzhou/$imagename
  docker push fosilzhou/$imagename
done
