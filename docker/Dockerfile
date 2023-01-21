# Utilizamos para crear el servidor de Ubuntu 22.04 una imagen oficial del repositorio de docker
FROM ubuntu:22.04

# Creamos un usuario para guardar los ficheros que podamos utilizar como configs
RUN adduser --disabled-password --gecos '' devuser

# Establecemos la zona horaria y con el comado RUN creamos un enlace simbolico del fichero
# /usr/share/zoneinfo/Europe/Madrid (Europe/Madrid se lo pasamos como parametro) y despues 
# añadimos Europe/Madrid en el fichero /etc/timezone
ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Actualizamos los repositorios e instalamos las aplicaciones necesarias 
# Aqui si necesitais otras podeis ponerlas al final de la linea
RUN apt-get update -y \
    && apt-get install -y git acl openssl openssh-client wget zip curl gcc make perl vim htop \ 
    libpng-dev zlib1g-dev libzip-dev libxml2-dev libicu-dev \ 
    apache2 php-mysql php-curl php-tidy php-gd php-cli php-pear php-pgsql php-dev libapache2-mod-php \
    php-mbstring apache2-dev net-tools

# Actualizamos el sistema por si hay alguna actualizaciṕn
RUN apt-get upgrade -y

# Despues de instalarlo todo activamos el mod_rewrite en apache para poder utilizar url friendly
RUN ln -s /etc/apache2/mods-available/rewrite.load /etc/apache2/mods-enabled/rewrite.load 

# En estas tres lineas que siguen creamos tres directos en nuestro nuevo servidor Ubuntu
# php = en este directorio mapeamos (despues con el fichero docker-compose.yml) nuestros proyectos
# web o no web que tenemos en algun directorio de nuestro ordenador
RUN mkdir -p /var/www/html/php

# creamos el directorio donde pondremos los ficheros de configuración que utilizaremos en le servidor
RUN mkdir -p /home/devuser/config

# Creamos un directorio temp para poder dejar fciheros que necesitemos en el servidor
RUN mkdir -p /home/devuser/temp

# creamos un enlace simbolico de nuestro fichero de virtualhosts de apache al directorio de 
# apache donde tiene que estar
RUN ln -s /home/devuser/config/2023-php.conf  /etc/apache2/sites-enabled/2023-php.conf

# Instalamos composer, si utilizamos algun framework como symfony nos hara falta
RUN curl https://getcomposer.org/composer.phar -o /usr/bin/composer && chmod +x /usr/bin/composer

# Le decimos que escuche en el puerto 80 para el servidor Web
EXPOSE 80

# y le decimos que al arrancar la maquina ejecute apache2 para que este listo para trabajar.
ENTRYPOINT ["apache2ctl", "-D", "FOREGROUND"]