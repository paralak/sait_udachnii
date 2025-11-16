FROM nginx:alpine

ENV NGINX_ENV=production \
    NGINX_MAX_BODY_SIZE=64m \
    NGINX_CLIENT_BODY_TIMEOUT=60s

WORKDIR /var/www/html

# Устанавливаем дополнительные утилиты для отладки (опционально)
RUN apk add --no-cache curl

# Копируем конфигурационные файлы
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/conf.d/ /etc/nginx/conf.d/
COPY src/html/ /var/www/html/

# Настройка прав и директорий
RUN mkdir -p /var/log/nginx /var/cache/nginx && \
    chown -R nginx:nginx /var/www/html /var/log/nginx /var/cache/nginx && \
    chmod -R 755 /var/www/html && \
    # Очищаем дефолтную конфигурацию если нужно
    rm -f /etc/nginx/conf.d/default.conf

# Проверяем синтаксис конфигурации
RUN nginx -t

EXPOSE 80 443

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD curl -f http://localhost/ || exit 1

CMD ["nginx", "-g", "daemon off;"]