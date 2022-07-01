FROM nginx

COPY config/nginx-container-default.conf.template /etc/nginx/templates/default.conf.template

ADD $PWD/certs/*.key /etc/ssl/private/
ADD $PWD/certs/*.crt /etc/ssl/certs/