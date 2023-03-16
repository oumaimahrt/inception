FROM debian:buster

RUN apt-get -y update && apt-get install -y nginx && apt-get install openssl -y

COPY conf/nginx.conf /etc/nginx/conf.d/nginx.conf

COPY tools/ohrete.42.fr.crt 	/etc/nginx/ssl/ohrete.42.fr.crt

COPY tools/ohrete.42.fr.key 	/etc/nginx/ssl/ohrete.42.fr.key

RUN	ln -s /etc/nginx/conf.d/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
