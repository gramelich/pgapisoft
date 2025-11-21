# ----------------------------------
# ESTÁGIO 1: BUILD (Compilação)
# ----------------------------------
# Usa Node 20 (estável e moderno) para a fase de build
FROM node:20-alpine AS builder

# Define o diretório de trabalho dentro do contêiner
WORKDIR /usr/src/app

# Copia package.json e lockfiles da subpasta 'api'
# A subpasta 'api/' é o caminho no contexto de build (repositório)
COPY api/package*.json ./

# Instala todas as dependências (incluindo as de desenvolvimento, necessárias para a compilação)
RUN npm install

# Copia o código fonte da API
COPY api/ .

# EXECUTA A COMPILAÇÃO DO TYPESCRIPT: Cria a pasta 'dist/'
# Este passo executa o script "build": "nest build"
RUN npm run build
# ----------------------------------


# ----------------------------------
# ESTÁGIO 2: PRODUCTION (Execução)
# ----------------------------------
# Usa a imagem base leve do Node 20 para o ambiente de produção
FROM node:20-alpine AS production

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copia apenas os arquivos essenciais da fase de build:
# 1. Copia o package.json (necessário para o 'npm run start:prod')
COPY --from=builder /usr/src/app/package.json ./

# 2. Copia a pasta node_modules (dependências instaladas)
COPY --from=builder /usr/src/app/node_modules ./node_modules

# 3. Copia a pasta 'dist' (o código JavaScript COMPILADO)
COPY --from=builder /usr/src/app/dist ./dist

# Expõe a porta (padrão 3000 para NestJS)
EXPOSE 3010

# Define o comando de INÍCIO para produção. 
# Usamos o 'start:prod', que executa o código compilado em 'dist/main.js'.
CMD [ "npm", "run", "start:prod" ]
