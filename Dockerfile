FROM node:14.4-alpine3.12

ENV CHROMIUM_VERSION 83.0.4103.97-r0
ENV DISPLAY :99.0

WORKDIR /app

RUN addgroup -S prerender && adduser -S -g prerender prerender  && \
    apk add --no-cache ca-certificates && \
    apk add chromium=$CHROMIUM_VERSION --no-cache --repository http://nl.alpinelinux.org/alpine/edge/community && \
    rm -rf /var/cache/apk/*

COPY . /app

RUN npm install --no-audit --progress=false

USER prerender

EXPOSE 3000

CMD [ "node", "server.js" ]
