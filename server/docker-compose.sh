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

composescript="docker-compose.yml"

if [ "$1" = "rinkeby" ]; then
   composescript="docker-compose-rinkeby.yml"
   echo "Running in Rinkeby Infura mode..."
elif [ "$1" = "infra" ]; then
   composescript="docker-compose-infra.yml"
   echo "Running in Infrastructure mode..."
fi

echo "Start"
docker-compose -f "$composescript" up -d
[ $? -eq 0 ] || exit $?;

trap "docker-compose -f "$composescript" kill" INT
