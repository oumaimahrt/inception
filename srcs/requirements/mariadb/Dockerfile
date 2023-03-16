FROM debian:buster

RUN apt-get update -y && apt-get install mariadb-server -y

COPY ./conf/my_db.cnf /etc/mysql/mariadb.conf.d/

COPY ./tools/my_db.sh /

RUN chmod 777 my_db.sh

EXPOSE 3306

CMD ["/my_db.sh"]
