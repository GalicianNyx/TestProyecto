# Usar una imagen base de Python para facilitar la instalación
FROM python:3.9-slim

# Actualizar el sistema y preparar las dependencias necesarias
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libmagic1 \
    && apt-get clean

# Crear un entorno virtual para evitar conflictos
RUN python3 -m venv /opt/venv

# Activar el entorno virtual e instalar zap-cli dentro del entorno
RUN /opt/venv/bin/pip install --upgrade pip \
    && /opt/venv/bin/pip install git+https://github.com/Grunny/zap-cli.git

# Verificar la instalación de zap-cli
RUN /opt/venv/bin/zap-cli --version

# Crear el directorio de Nginx y clonar el repositorio
RUN mkdir -p /usr/share/nginx/html
RUN rm -rf /usr/share/nginx/html/* && chmod -R 755 /usr/share/nginx/html
RUN git clone https://github.com/GalicianNyx/TestProyecto.git /usr/share/nginx/html

# Exponer el puerto 9090
EXPOSE 9090

# Instalar y configurar Nginx
RUN apt-get install -y nginx
CMD ["nginx", "-g", "daemon off;"]
