#!/bin/bash

container=$1

docker start $container
docker exec $container /bin/bash -c "cd /root/liumos && make run GUI=n GDB=n"
docker stop $container

