# Etapa de build
FROM node:20-alpine AS builder

WORKDIR /usr/src/app

# Copiar arquivos de dependências
COPY package*.json ./
COPY tsconfig*.json ./
COPY nest-cli.json ./

# Instalar dependências
RUN npm ci

# Copiar código fonte
COPY src ./src

# Build da aplicação
RUN npm run build

# Etapa de produção
FROM node:20-alpine

WORKDIR /usr/src/app

# Copiar arquivos de dependências
COPY package*.json ./

# Instalar apenas dependências de produção
RUN npm ci --only=production && npm cache clean --force

# Copiar build do estágio anterior
COPY --from=builder /usr/src/app/dist ./dist

# Expor porta (ajuste se necessário)
EXPOSE 3010

# Iniciar aplicação
CMD ["node", "dist/main.js"]
