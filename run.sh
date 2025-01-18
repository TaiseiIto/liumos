#!/bin/bash

container=$1

docker start $container
docker exec --workdir /root/liumos $container ./run_on_container.sh
docker stop $container

