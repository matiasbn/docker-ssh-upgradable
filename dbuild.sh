#!/bin/bash

sudo docker build . --tag minimum
sudo docker container rm -f docker-minimum
sudo docker run --name docker-minimum --publish 222:22 --detach minimum
# sudo docker exec -ti worker /bin/bash