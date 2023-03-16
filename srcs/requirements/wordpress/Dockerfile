FROM debian:buster

RUN apt-get update 

RUN apt-get install php-fpm php-mysql -y 

RUN apt-get install curl -y

COPY ./tools/my_wp.sh /tmp

# COPY ./conf/wp_config.php /tmp

RUN chmod +x /tmp/my_wp.sh

EXPOSE 9000

CMD [ "/tmp/my_wp.sh" ]