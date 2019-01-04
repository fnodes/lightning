#!/bin/bash
docker pull fullnodes/lighting:latest
docker stop lightningd
docker rm lightningd
docker volume create lightning
docker run -dit --name lightningd --net=host --restart=always -v lighting:/root/.lightning fullnodes/lightning:latest --bitcoin-rpcconnect=127.0.0.1 --bitcoin-rpcuser=admin --bitcoin-rpcpassword=changeme --network=bitcoin --alias=fullnodes --log-level=debug
mkdir -p ~/.bin
cp $(pwd)/bin/lightning* ~/.bin
