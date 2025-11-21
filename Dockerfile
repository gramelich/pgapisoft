# Etapa de build
FROM node:20-alpine AS builder

WORKDIR /usr/src/app

# Copiar arquivos do projeto API
COPY api/package*.json ./
COPY api/nest-cli.json ./
COPY api/tsconfig*.json ./

# Instalar dependências
RUN npm ci

# Copiar código fonte da API
COPY api/ ./

# Build da aplicação
RUN npm run build

# Etapa de produção
FROM node:20-alpine

WORKDIR /usr/src/app

# Copiar package files
COPY api/package*.json ./

# Instalar apenas dependências de produção
RUN npm ci --only=production && npm cache clean --force

# Copiar build do estágio anterior
COPY --from=builder /usr/src/app/dist ./dist

# Copiar Prisma (se estiver usando)
COPY --from=builder /usr/src/app/prisma ./prisma

# Expor porta
EXPOSE 3010

# Iniciar aplicação
CMD ["node", "dist/main.js"]
