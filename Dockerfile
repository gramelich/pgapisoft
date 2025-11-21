# 1. Defina a Imagem Base
FROM node:18-alpine

# 2. Defina o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# 3. Copia package.json do diretório 'api/' do contexto de build
# para o WORKDIR (./) no contêiner.
COPY api/package*.json ./

# 4. Instala as dependências
RUN npm install

# 5. Copia o restante do código da aplicação, também da subpasta 'api'
COPY api/ .

# 6. Expõe a porta que a sua API usa (ajuste se for diferente de 3000)
EXPOSE 3010

# 7. Define o comando para iniciar a aplicação
CMD [ "npm", "start" ]
