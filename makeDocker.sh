#!/usr/bin/env bash

case $1 in

  # Paramos los contenedores
	stop)
     echo "Parando containers:  docker-compose down"
    docker-compose down
  ;;

  # Arrancamos los contenedores y si no existen los crea
  start)
    echo "Iniciando containers:  docker-compose up -d"
    docker-compose up -d
  ;;

  # Accedemos a un contenedor con si fuerea un servidor remoto pasandole
  # como parametro el nombre del contedor, la forma de utilizarlo seria
  # ./makeDocker.sh lamp-apache
  # y este comando ejecutaria la sentencia "docker exec -it lamp-apache bash"
  ssh)
    echo "docker exec -it $2 bash"
    docker exec -it $2 bash
  ;;
  
  # Accedemos a un contenedor con si fuerea un servidor remoto pasandole
  # como parametro el nombre del contedor y el comando a ejecutar, la forma de utilizarlo seria
  # ./makeDocker.sh lamp-apache bash
  # y este comando ejecutaria la sentencia "docker exec -it lamp-apache bash"
	execute)
    echo "docker exec -it $2 $3"
    docker exec -it $2 $3
  ;;

esac
#

