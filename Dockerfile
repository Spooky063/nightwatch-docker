FROM jwilder/dockerize:latest as dockerize

FROM node:18

WORKDIR /usr/src/app

COPY package*.json ./

RUN apt update && apt install -y libnss3

ENV DOCKERIZE_VERSION v0.6.1
RUN apt update && apt install -y wget && \
    wget https://github.com/jwilder/dockerize/releases/download/${DOCKERIZE_VERSION}/dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz && \
    tar -C /usr/local/bin -xzvf dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz && \
    rm dockerize-linux-amd64-${DOCKERIZE_VERSION}.tar.gz

RUN npm install

COPY . .

CMD ["dockerize", "-wait", "tcp://selenium:4444", "-timeout", "60s", "npm", "run", "test:nightwatch"]