FROM node:23.3.0-alpine3.19@sha256:4ebaf825598cb2f47eb2a52c4a0badf800681b49064e9cae73d3ae7a31a7ee44 AS builder

ENV PORT 5000

WORKDIR /app

COPY package.json package-lock.json ./
RUN npm ci

COPY . ./
RUN npm run build

CMD npm run dev

EXPOSE $PORT
