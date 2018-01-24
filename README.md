Docker Image for Prerender
==========================

Dockerized Prerender + Chrome Headless (chromium-browser on Alpine Linux)

Example
-------

```
docker container run --name prerender --rm -it -p 3000:3000 ball6847/prerender
```

To run with docker-compose

```yml
version: '3'

services:
  prerender:
    image: ball6847/prerender:latest
    restart: unless-stopped
    ports:
      - 3000:3000
```

Author
------

Porawit Poboonma <ball6847@gmail.com>
