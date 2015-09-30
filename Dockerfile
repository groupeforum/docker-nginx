FROM nginx

MAINTAINER Florian Girardey <florian@girardey.net>

COPY nginx.conf /etc/nginx/nginx.conf
COPY wordpress.conf /etc/nginx/sites-available/wordpress.conf

RUN mkdir /etc/nginx/sites-enabled

RUN ln -s /etc/nginx/sites-available/wordpress.conf /etc/nginx/sites-enabled/wordpress

COPY php-fpm.conf /etc/nginx/conf.d/php-fpm.conf

RUN usermod -u 1000 www-data

CMD ["nginx", "-g", "daemon off;"]
