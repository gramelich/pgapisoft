# ==================================
# ESTÁGIO 1: BUILD (Compilação do TypeScript)
# ==================================
# Usamos o node:20 para aproveitar melhorias de performance e segurança
FROM node:20-alpine AS builder

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copia package.json e package-lock.json da pasta 'api'
# para garantir que o cache do Docker seja usado se as dependências não mudarem.
COPY api/package*.json ./

# Instala todas as dependências (incluindo devDependencies necessárias para o 'npm run build')
RUN npm install

# Copia o código fonte da API
COPY api/ .

# EXECUTA A COMPILAÇÃO: Cria a pasta 'dist/'
# Seu script "build": "nest build" será executado aqui.
RUN npm run build
# ==================================


# ==================================
# ESTÁGIO 2: PRODUCTION (Ambiente de Execução Leve)
# ==================================
# Usamos a imagem Alpine, mais leve, sem a necessidade de ferramentas de desenvolvimento.
FROM node:20-alpine AS production

# Define o diretório de trabalho
WORKDIR /usr/src/app

# Copia apenas os arquivos necessários da fase de build:
# 1. Copia o package.json (para que o CMD 'npm run start:prod' funcione)
COPY --from=builder /usr/src/app/package.json ./

# 2. Copia a pasta node_modules (dependências de produção - se você usar um build otimizado, só as de prod viriam, mas copiaremos todas por segurança)
COPY --from=builder /usr/src/app/node_modules ./node_modules

# 3. Copia a pasta 'dist' (o código JavaScript compilado!)
COPY --from=builder /usr/src/app/dist ./dist

# Expõe a porta (O NestJS padrão é 3000, verifique seu main.ts)
EXPOSE 3000

# Define o comando de INÍCIO para produção, usando o script mais apropriado:
# "start:prod": "node dist/main"
CMD [ "npm", "run", "start:prod" ]
