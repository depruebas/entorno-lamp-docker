#!/usr/bin/env bash

case $1 in

	stop)
     echo "Parando containers:  docker-compose down"
    docker-compose down
  ;;

  start)
    echo "Iniciando containers:  docker-compose up -d"
    docker-compose up -d
  ;;

  ssh)
    docker exec -it $2 bash
  ;;
  
	execute)
    docker exec -it $2 $3
  ;;

esac
#

