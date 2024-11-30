FROM nginx:alpine

# Instalar git para poder clonar el repositorio
RUN apk add --no-cache git

# Clonar el repositorio de GitHub público en un directorio temporal
RUN git clone https://github.com/GalicianNyx/TestProyecto.git /tmp/TestProyecto

# Copiar los archivos del repositorio clonado al directorio de Nginx
RUN cp -r /tmp/TestProyecto/* /usr/share/nginx/html/

# Exponer el puerto 9090 donde se ejecutará la aplicación
EXPOSE 9090
