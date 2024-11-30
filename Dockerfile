# Usar una imagen base de Python para facilitar la instalación
FROM python:3.9-slim

# Instalar git y otras dependencias
RUN apt-get update && apt-get install -y git libmagic1

# Crear un entorno virtual
RUN python3 -m venv /opt/venv

# Activar el entorno virtual y actualizar pip
RUN /opt/venv/bin/pip install --upgrade pip

# Instalar zap-cli en el entorno virtual
RUN /opt/venv/bin/pip install git+https://github.com/Grunny/zap-cli.git

# Crear el directorio para Nginx
RUN mkdir -p /usr/share/nginx/html

# Asegurarnos de que el directorio está vacío y con permisos adecuados
RUN rm -rf /usr/share/nginx/html/* && chmod -R 755 /usr/share/nginx/html

# Clonar el repositorio de GitHub público (Tu código)
RUN git clone https://github.com/GalicianNyx/TestProyecto.git /usr/share/nginx/html

# Exponer el puerto 9090 donde se ejecutará la aplicación
EXPOSE 9090

# Instalar Nginx
RUN apt-get install -y nginx

# Comando para ejecutar nginx en segundo plano
CMD ["nginx", "-g", "daemon off;"]
