#!/bin/bash
echo "Creating a new layer ....."
current_timestamp=$(date +"%m_%d_%Y_%H_%M_%S")
FILE="meta-$current_timestamp"
bitbake-layers create-layer $FILE &> /dev/null
echo "New layer created successfully"
echo "Adding new layer to BBlayers.conf ....."
cd build
bitbake-layers add-layer ../$FILE &> /dev/null
cd ..
echo "New layer added successfully"