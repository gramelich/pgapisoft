# Dockerfile
# ...
WORKDIR /usr/src/app

# Copia TUDO (incluindo package.json e node_modules/ se não estiverem no .dockerignore)
COPY . .

# Instala as dependências (agora package.json está em /usr/src/app)
RUN npm install

# Inicia a aplicação
CMD ["npm", "start"]
