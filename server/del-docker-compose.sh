#!/bin/bash
#Thanks to Gregoire Jeanmart for this script
echo "removing old containers"
docker rm -f server_kafka_1
docker rm -f server_zookeeper_1
docker rm -f server_mongodb_1
docker rm -f server_eventeum_1
docker rm -f server_parity_1
docker-compose down

echo "removing storage"
sudo rm -rf $HOME/mongodb/data
