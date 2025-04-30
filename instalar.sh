#!/bin/bash
sudo apt update && sudo apt upgrade -y &&
sudo apt install -y zip wget curl &&
mkdir -p /opt && cd /opt &&
wget -O utorrent-server.zip https://raw.githubusercontent.com/LaelsonCG/utorrent-server/refs/heads/main/utorrent-server.zip &&
unzip utorrent-server.zip &&
sudo dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.13_amd64.deb &&
wget -O /etc/systemd/system/utorrent-server.service https://raw.githubusercontent.com/LaelsonCG/utorrent-server/refs/heads/main/utorrent-server.service &&
systemctl daemon-reload && systemctl enable utorrent-server && service utorrent-server start &&

# Obter o ipv4 da maquina
ip=$(curl -4 ifconfig.me)
echo -e "\nACESSE: http://${ip}:8080/gui"
echo -e "Usuario: admin"
echo -e "Senha: Deixe vazio. Você pode definir uma senha pela interface gui"
