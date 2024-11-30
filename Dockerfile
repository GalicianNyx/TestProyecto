# Usar la imagen base de nginx con Alpine
FROM nginx:alpine

# Instalar git, gcc y dependencias para compilar paquetes Python
RUN apk add --no-cache \
    git \
    gcc \
    libc-dev \
    python3-dev \
    py3-pip \
    pipx

# Instalar zap-cli usando pipx
RUN pipx install zap-cli

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
