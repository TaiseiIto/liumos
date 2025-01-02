#!/bin/bash

container=$1

docker start $container
docker exec $container /bin/bash -c "cd /root/liumos && ./run_on_container.sh"
docker stop $container

