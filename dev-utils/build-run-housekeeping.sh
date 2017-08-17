#!/bin/bash
docker build --rm -t alerta-housekeeping -f ../HousekeepingDockerfile ../

docker stop alerta-housekeeping
docker rm alerta-housekeeping

docker run -it -p 9000:80 --name alerta-housekeeping --link alerta-db:db --env-file envfile alerta-housekeeping