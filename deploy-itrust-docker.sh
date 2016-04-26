#!/usr/bin/env bash

# Install and start Docker
if type "dnf" &> /dev/null ; then
  sudo dnf install -y docker docker-compose wget unzip
  sudo systemctl start docker
fi

sudo docker build -t ncsu/itrust -f itrust-docker/Dockerfile.tomcat .
sudo docker build -t ncsu/mysql -f itrust-docker/Dockerfile.mysql .

cd itrust-docker
sudo docker-compose up
