# Usar la imagen base de OWASP ZAP
FROM owasp/zap2docker-stable

# Crear el directorio para Nginx
RUN mkdir -p /usr/share/nginx/html

# Asegurarnos de que el directorio está vacío y con permisos adecuados
RUN rm -rf /usr/share/nginx/html/* && chmod -R 755 /usr/share/nginx/html

# Clonar el repositorio de GitHub público
RUN git clone https://github.com/GalicianNyx/TestProyecto.git /usr/share/nginx/html

# Exponer el puerto 9090 donde se ejecutará la aplicación
EXPOSE 9090

# Comando para ejecutar nginx en segundo plano
CMD ["nginx", "-g", "daemon off;"]
