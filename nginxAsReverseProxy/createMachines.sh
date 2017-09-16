#!/bin/bash

docker-machine create consul
eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env consul)
docker container run -d -p 8500:8500 -h "consul" progrium/consul -server -bootstrap
eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env default)
KV_IP=$(docker-machine ip consul)
KV_ADDR="consul://${KV_IP}:8500"
docker-machine create --swarm --swarm-master --swarm-discovery=$KV_ADDR --engine-opt="cluster-store=${KV_ADDR}" --engine-opt="cluster-advertise=eth1:2376" manager
docker-machine create --swarm --swarm-discovery=$KV_ADDR --engine-opt="cluster-store=${KV_ADDR}" --engine-opt="cluster-advertise=eth1:2376" node1
docker-machine create --swarm --swarm-discovery=$KV_ADDR --engine-opt="cluster-store=${KV_ADDR}" --engine-opt="cluster-advertise=eth1:2376" node2
docker-machine create --swarm --swarm-discovery=$KV_ADDR --engine-opt="cluster-store=${KV_ADDR}" --engine-opt="cluster-advertise=eth1:2376" node3
docker-machine create --swarm --swarm-discovery=$KV_ADDR --engine-opt="cluster-store=${KV_ADDR}" --engine-opt="cluster-advertise=eth1:2376" public01
eval $(docker-machine env --swarm manager)
docker info | grep "Server Version:"
eval $("C:\Program Files\Docker Toolbox\docker-machine.exe" env default)