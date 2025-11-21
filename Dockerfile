# Usa uma imagem base oficial do Node.js
FROM node:18-alpine

# Define o diretório de trabalho no container
WORKDIR /usr/src/app

# Copia os arquivos package.json e package-lock.json (ou yarn.lock)
# para instalar as dependências
COPY package*.json ./

# Instala as dependências
RUN npm install

# Copia o restante do código da aplicação
COPY . .

# Expõe a porta que a aplicação escuta (ajuste conforme necessário, ex: 3000, 8080)
EXPOSE 3000

# Comando para iniciar a aplicação
CMD [ "npm", "start" ]
