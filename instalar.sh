#!/bin/bash

# Cores
verde="\033[1;32m"
azul="\033[1;34m"
vermelho="\033[1;31m"
reset="\033[0m"

echo -e "${azul}##############################################"
echo -e "#     INSTALADOR UTORRENT SERVER by LaelsonCG"
echo -e "#     GitHub: https://github.com/LaelsonCG"
echo -e "##############################################${reset}\n"

echo -e "${verde}[+] Atualizando pacotes do sistema...${reset}"
sudo apt update -qq && sudo apt upgrade -y -qq

echo -e "${verde}[+] Instalando dependências...${reset}"
sudo apt install -y -qq zip wget curl > /dev/null

echo -e "${verde}[+] Baixando arquivos...${reset}"
mkdir -p /opt && cd /opt
wget -q -O utorrent-server.zip https://raw.githubusercontent.com/LaelsonCG/utorrent-server/refs/heads/main/utorrent-server.zip

echo -e "${verde}[+] Extraindo pacotes...${reset}"
unzip -qq utorrent-server.zip

echo -e "${verde}[+] Instalando bibliotecas necessárias...${reset}"
sudo dpkg -i libssl1.0.0_1.0.2n-1ubuntu5.13_amd64.deb > /dev/null 2>&1

echo -e "${verde}[+] Configurando serviço...${reset}"
wget -q -O /etc/systemd/system/utorrent-server.service https://raw.githubusercontent.com/LaelsonCG/utorrent-server/refs/heads/main/utorrent-server.service
sudo systemctl daemon-reload
sudo systemctl enable utorrent-server > /dev/null
sudo systemctl start utorrent-server

ip=$(curl -s -4 ifconfig.me)

echo -e "\n${verde}INSTALAÇÃO CONCLUÍDA.${reset}"
echo -e "---------------------------------------------------------------------------"
echo -e "${azul}ACESSE:${reset} http://${ip}:8080/gui"
echo -e "${azul}Usuário:${reset} admin"
echo -e "${azul}Senha:${reset} (deixe em branco)"
echo -e "Você pode definir uma senha pela interface gráfica."

