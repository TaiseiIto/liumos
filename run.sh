#!/bin/bash

container=$1

docker stop $container
docker start $container
docker exec --workdir /root/liumos $container ./run_on_container.sh

