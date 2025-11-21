# 1. Defina a Imagem Base (Define o "Build Stage")
FROM node:18-alpine

# 2. Define o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# 3. Copia package.json e package-lock.json para aproveitar o cache do Docker
# Isso é importante para que o Docker não refaça o 'npm install'
# toda vez que você altera apenas o código.
COPY package*.json ./

# 4. Instala as dependências
RUN npm install

# 5. Copia o restante do código da aplicação (incluindo o que foi alterado)
# Se você tiver um arquivo .dockerignore, o Docker excluirá arquivos desnecessários (como node_modules local, .git)
COPY . .

# 6. Expõe a porta que a sua API usa (ajuste se for diferente de 3000)
EXPOSE 3010

# 7. Define o comando para iniciar a aplicação
CMD [ "npm", "start" ]
