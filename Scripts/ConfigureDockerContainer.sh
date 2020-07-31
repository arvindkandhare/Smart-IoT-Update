#!/bin/bash
echo "Docker Container started"
echo "Installing rsync ....."
apt-get update &> /dev/null
apt-get install -y rsync &> /dev/null
echo "Installation successfull"

echo "Running rsync for synchronizing the file system ....."
rsync -avrl /tmp/rootfs ./rootfs &> /dev/null
echo "File system successfully synchronized"
echo "Exiting the docker container ....."
exit