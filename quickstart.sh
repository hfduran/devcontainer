#!/bin/bash

docker build -t devcontainer-img .

docker run -d -p 5000:5000 -p 8080:8080 --name devcontainer-test devcontainer-img

docker exec -it devcontainer-test /bin/bash