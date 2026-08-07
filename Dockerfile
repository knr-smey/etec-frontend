# syntax=docker/dockerfile:1

# ---- Stage 1: install dependencies ----
FROM node:20-alpine AS deps
WORKDIR /app
COPY package.json package-lock.json* ./
RUN npm ci

# ---- Stage 2: dev (hot-reload, used by docker-compose) ----
FROM node:20-alpine AS dev
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
ENV HOST=0.0.0.0
EXPOSE 3000
CMD ["npm", "run", "dev"]

# ---- Stage 3: build the SSR output ----
FROM node:20-alpine AS build
WORKDIR /app
COPY --from=deps /app/node_modules ./node_modules
COPY . .
RUN npm run build

# ---- Stage 4: production SSR runtime (default target) ----
FROM node:20-alpine AS runtime
WORKDIR /app
ENV NODE_ENV=production
ENV NUXT_HOST=0.0.0.0
ENV NUXT_PORT=3000
COPY --from=build /app/.output ./.output
EXPOSE 3000
CMD ["node", ".output/server/index.mjs"]
