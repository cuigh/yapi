# step: build
FROM node:8-alpine as builder

ARG TAG=v1.3.17
ARG REGISTRY=https://registry.npm.taobao.org

RUN apk add --no-cache git python make \
    && git clone --branch $TAG --depth 1 https://github.com/YMFE/yapi.git /app \
    && cd /app \
    && npm install --no-optional --production --registry ${REGISTRY}

# step: run
FROM node:8-alpine

WORKDIR /app/yapi
COPY --from=builder /app .

EXPOSE 3000
ENTRYPOINT [ "node" ]
CMD [ "server/app.js" ]