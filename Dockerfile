# 1. Defina a Imagem Base
FROM node:18-alpine

# 2. Defina o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# 3. CORREÇÃO: Copia de dentro da pasta 'api' (no contexto de build) para o WORKDIR (./)
COPY api/package*.json ./

# 4. Instala as dependências
RUN npm install

# 5. Copia o restante do código da aplicação, também da subpasta 'api'
COPY api/ .

# 6. Expõe a porta
EXPOSE 3010

# 7. Define o comando para iniciar
CMD [ "npm", "start" ]
