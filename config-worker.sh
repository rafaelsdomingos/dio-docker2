#!/bin/bash
sudo apt-get update && apt-get install nfs-common links -y
sudo showmount -e 172.30.161.220
sudo mount 172.30.161.220:/var/lib/docker/volumes/app/_data /var/lib/docker/volumes/app/_data