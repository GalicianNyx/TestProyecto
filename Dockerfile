# Usar la imagen oficial de Nginx como base
FROM nginx:alpine

# Instalar git para poder clonar el repositorio
RUN apk add --no-cache git

# Clonar el repositorio de GitHub donde se encuentra el HTML
RUN git clone https://github.com/GalicianNyx/TestProyecto.git /usr/share/nginx/html

# Exponer el puerto 9090 donde se ejecutará la aplicación
EXPOSE 9090

# Nginx automáticamente servirá el contenido del directorio /usr/share/nginx/html
