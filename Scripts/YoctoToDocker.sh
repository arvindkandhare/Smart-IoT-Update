#!/bin/bash
echo "Creating and running docker container with yocto image ....."

cat ConfigureDockerContainer.sh | sudo docker run -i -v $BUILDDIR/tmp/work/qemux86_64-poky-linux/core-image-sato/1.0-r0/rootfs:/tmp/rootfs $1 bash

container_ID=$(sudo docker ps -l -q)

echo "Docker container created successfully with container ID: $container_ID"
echo "----------------------------------------------------------------------"
current_timestamp=$(date +"%m_%d_%Y_%H_%M_%S")
FILE="yocto_$current_timestamp"
echo "Creating docker image ....."
sudo docker commit $container_ID $FILE &> /dev/null
echo "Docker Image with name $FILE created successfully"