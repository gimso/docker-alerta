#!/bin/bash
docker build --rm -t alerta -f ../Dockerfile ../

docker stop alerta
docker rm alerta

docker run -it -p 9000:80 --name alerta --link alerta-db:db --env-file envfile alerta