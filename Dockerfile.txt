# Imagen base con Apache y PHP
FROM php:8.2-apache

# Instalar extensiones necesarias para TestLink
RUN docker-php-ext-install mysqli mbstring xml gd

# Copiar todos los archivos del repositorio al contenedor
COPY . /var/www/html/

# Cambiar permisos (por si TestLink necesita escribir logs)
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Exponer el puerto 80
EXPOSE 80

# Comando de inicio
CMD ["apache2-foreground"]