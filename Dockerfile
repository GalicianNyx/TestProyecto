# Usar una imagen base de Python para facilitar la instalación
FROM python:3.9-slim

# Instalar git
RUN apt-get update && apt-get install -y git

# Instalar las dependencias necesarias para la instalación de zap-cli
RUN apt-get install -y libmagic1

# Clonar zap-cli desde GitHub y luego instalar
RUN git clone https://github.com/ZapCyber/zap-cli.git /zap-cli
WORKDIR /zap-cli
RUN pip3 install .

# Crear el directorio para Nginx
RUN mkdir -p /usr/share/nginx/html

# Asegurarnos de que el directorio está vacío y con permisos adecuados
RUN rm -rf /usr/share/nginx/html/* && chmod -R 755 /usr/share/nginx/html

# Clonar el repositorio de GitHub público
RUN git clone https://github.com/GalicianNyx/TestProyecto.git /usr/share/nginx/html

# Exponer el puerto 9090 donde se ejecutará la aplicación
EXPOSE 9090

# Instalar Nginx
RUN apt-get install -y nginx

# Comando para ejecutar nginx en segundo plano
CMD ["nginx", "-g", "daemon off;"]
