# Utilizamos la imagen base de Nginx
FROM nginx:alpine

# Instalar git para poder clonar el repositorio
RUN apk add --no-cache git

# Crear el directorio de destino en Nginx
RUN mkdir -p /usr/share/nginx/html

# Limpiar el contenido previo (si existe) y darle los permisos correctos
RUN rm -rf /usr/share/nginx/html/* && chmod -R 755 /usr/share/nginx/html

# Clonar el repositorio desde GitHub
RUN git clone https://github.com/GalicianNyx/TestProyecto.git /usr/share/nginx/html

# Exponer el puerto 9090 donde se ejecutará la aplicación
EXPOSE 9090

# Iniciar Nginx cuando el contenedor se ejecute
CMD ["nginx", "-g", "daemon off;"]
