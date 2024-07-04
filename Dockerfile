ARG NODE_VERSION=18
FROM node:${NODE_VERSION} as node_base

ENV NODE_ENV=development

WORKDIR /usr/src/app

COPY --link package*.json ./

RUN apt-get update && apt-get install -y --no-install-recommends \
    libnss3 \
    && rm -rf /var/lib/apt/lists/*

RUN set -eux; \
    npm install

COPY --link . ./

FROM jwilder/dockerize:latest as dockerize
FROM node_base as node_build

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    && rm -rf /var/lib/apt/lists/*

ENV DOCKERIZE_VERSION v0.6.1
RUN wget https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz && \
    rm dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz

FROM node_build as node_test

CMD ["dockerize", "-wait", "tcp://selenium:4444", "-timeout", "60s", "npm", "run", "test:nightwatch"]