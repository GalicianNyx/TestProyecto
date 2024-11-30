# Usar la imagen base de nginx con Alpine
FROM nginx:alpine

# Instalar git para poder clonar el repositorio
RUN apk add --no-cache git

# Instalar Python3 y pip para poder instalar zap-cli
RUN apk add --no-cache python3 py3-pip

# Instalar zap-cli
RUN pip3 install zap-cli

# Crear el directorio si no existe
RUN mkdir -p /usr/share/nginx/html

# Asegurarnos de que el directorio está vacío y con permisos adecuados
RUN rm -rf /usr/share/nginx/html/* && chmod -R 755 /usr/share/nginx/html

# Clonar el repositorio de GitHub público
RUN git clone https://github.com/GalicianNyx/TestProyecto.git /usr/share/nginx/html

# Exponer el puerto 9090 donde se ejecutará la aplicación
EXPOSE 9090

# Comando para ejecutar nginx en segundo plano
CMD ["nginx", "-g", "daemon off;"]
