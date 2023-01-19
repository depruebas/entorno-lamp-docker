#!/usr/bin/env bash

case $1 in

	stop)
    docker-compose down
  ;;

  start)
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

