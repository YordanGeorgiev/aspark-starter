#!/bin/bash
# file: src/bash/aspark-starter/install-docker-on-ubuntu-17.04.sh
# Purpose: 
# to automate the installation of docker-ce on Ubuntu 17.04 zesty
# 
# courtesy of https://askubuntu.com/a/944174/251228
set -eu -o pipefail # fail on error , debug all lines

# run as root
[ "$USER" = "root" ] || exec sudo "$0" "$@"

echo "=== $BASH_SOURCE on $(hostname -f) at $(date)" >&2

err_msg="\n\nthis script is only for Ubuntu 17.04 zesty, BUT you have: \n"$(lsb_release -a)
test $(lsb_release -cs) != "zesty" && echo -e "$err_msg"
test $(lsb_release -cs) != "zesty" && exit 1

echo Install Using the Repository
echo Update the apt package index:


apt-get update

echo Install packages to allow apt to use a repository over HTTPS:

apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common


echo Add Docker’s official GPG key:
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -


echo Verify that the key fingerprint is 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88.
apt-key fingerprint 0EBFCD88

echo << EOF_STDOUT
# the output should look like : 
# 
# pub   4096R/0EBFCD88 2017-02-22
# Key fingerprint = 9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
# uid                  Docker Release (CE deb) <docker@docker.com>
# sub   4096R/F273FCD8 2017-02-22

EOF_STDOUT


echo Use the following command to set up the stable repository for the amd64 architecture
# src: https://unix.stackexchange.com/a/181538/37428
# tested only for amd64
arch=$(dpkg --print-architecture)
add-apt-repository \
   "deb [arch=""$arch""] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo INSTALL DOCKER CE
sudo apt-get update
sudo apt-get install -y docker-ce

echo the docker binary is installed in
which docker

echo enable docker without sudo 
sudo usermod -aG docker ysg

echo DONE !!!
# eof file src/bash/aspark-starter/install-docker-on-ubuntu-17.04.sh
