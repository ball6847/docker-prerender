FROM node:9.4-alpine

ENV CHROMIUM_VERSION 63.0.3239.108-r0
ENV PRERENDER_VERSION 5.2.0
ENV DISPLAY :99.0

WORKDIR /app

RUN addgroup -S prerender && adduser -S -g prerender prerender  && \
    apk add --no-cache ca-certificates && \
    apk add chromium=$CHROMIUM_VERSION --no-cache --repository http://nl.alpinelinux.org/alpine/edge/community && \
    npm install prerender@5.2.0  && \
    rm -rf /var/cache/apk/*

COPY server.js /app/server.js

USER prerender

EXPOSE 3000

CMD [ "node", "server.js" ]
