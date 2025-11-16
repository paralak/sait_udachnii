FROM nginx:alpine

ENV NGINX_ENV=production

WORKDIR /var/www/html

COPY nginx.conf /etc/nginx/nginx.conf
COPY html/ /var/www/html/

CMD ["nginx", "-g", "daemon off;"]