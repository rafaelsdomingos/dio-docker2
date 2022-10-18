#!/bin/bash
sudo docker swarm init --advertise-addr=172.30.161.220

#configuração do script dos worker
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh

# criação do volume
sudo docker volume create app

#inicialização do serviço
sudo docker service create --name site1 --replicas 15 -dt -p 80:80 --mount type=volume,src=app,dst=/usr/local/apache2/htdocs httpd

#alteração do index
sudo cp /vagrant/index.html /var/lib/docker/volumes/app/_data/index.html

#instalação do nfs-server
sudo apt-get update && apt-get install nfs-server -y

#configuração do diretório para sincronização
sudo echo "/var/lib/docker/volumes/app/_data *(rw,sync,subtree_check)" >> /etc/exports
sudo exportfs -ar



