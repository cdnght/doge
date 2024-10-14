#!/bin/bash

# Update the package list
sudo apt-get update

# Install necessary packages
sudo apt-get install -y wget tar

# Download SRB Miner
wget https://github.com/doktor83/SRBMiner-Multi/releases/download/2.6.8/SRBMiner-Multi-2-6-8-Linux.tar.gz

# Extract the downloaded file
tar -xzvf SRBMiner-Multi-2-6-8-Linux.tar.gz

# Change directory to the extracted folder
cd SRBMiner-Multi-2-6-8 || exit

# Stop the mining agent if it's running
./agent-stop

# Copy the miner to the specified location
sudo cp SRBMiner-MULTI /opt/mmp/miners/sbrminer/

# Start the mining agent
./agent-start

# Run the guided setup
./guided-setup.sh <<EOF
NoxzyV1
n
minotaurx
stratum+tcp://minotaurx.sea.mine.zpool.ca:7019
DBbAv4ZWFhjFLGwNo9FgxZPf7HJJWwuLWQ
c=DOGE
n
EOF

# Start the miner with the specified script
./start_NoxzyV1.sh
