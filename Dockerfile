# Apache + PHP
FROM php:8.2-apache

# Extensiones necesarias para TestLink
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg62-turbo-dev libfreetype6-dev libzip-dev zip \
 && docker-php-ext-configure gd --with-freetype --with-jpeg \
 && docker-php-ext-install -j$(nproc) gd mysqli mbstring xml pdo pdo_mysql zip

# Copia el código
COPY . /var/www/html/

# Permisos para logs y área de subida
RUN mkdir -p /var/www/html/logs /var/www/html/upload_area \
 && chown -R www-data:www-data /var/www/html \
 && chmod -R 755 /var/www/html

# Exponer HTTP
EXPOSE 80

# Iniciar Apache
CMD ["apache2-foreground"]