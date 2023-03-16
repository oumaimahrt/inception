FROM debian:buster

RUN apt-get -y update && apt-get install -y nginx

COPY web.conf /etc/nginx/conf.d/nginx.conf

COPY index.html /var/html/www/index.html

RUN rm -f /etc/nginx/sites-enabled/default

RUN	ln -s /etc/nginx/conf.d/nginx.conf /etc/nginx/sites-enabled/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

