FROM nginx

MAINTAINER Florian Girardey <florian@girardey.net>

ADD nginx.conf /etc/nginx/
ADD wordpress.conf /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/wordpress
RUN rm /etc/nginx/sites-enabled/default

RUN echo "upstream php-upstream { server php:9000; }" > /etc/nginx/conf.d/upstream.conf

RUN usermod -u 1000 www-data

CMD ["nginx", "-g", "daemon off;"]
