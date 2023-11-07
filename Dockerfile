# Utiliza la imagen base de Node.js
FROM node:16

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Copia los archivos package.json y package-lock.json al contenedor
COPY package*.json ./

# Instala las dependencias del proyecto
RUN npm install

# Copia el resto de los archivos del proyecto al contenedor
COPY . .

# Construye la aplicación Angular en modo de producción
RUN npm run build -- --configuration=production

# Usa un servidor web ligero, como Nginx, para servir la aplicación
FROM nginx:alpine

# Copia los archivos de construcción de Angular al directorio de contenido del servidor web
COPY --from=0 /app/dist/* /usr/share/nginx/html/

# Expone el puerto 80
EXPOSE 80

# Comando para iniciar el servidor web cuando se ejecute el contenedor
CMD ["nginx", "-g", "daemon off;"]

