#!/bin/bash
# 
# system management

#######################################
# installs node
# Arguments:
#   None
#######################################
wwebjs_node_install() {
  print_banner
  printf "${WHITE} 💻 Instalando nodejs...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  curl -fsSL https://deb.nodesource.com/setup_20.x | sudo -E bash -
  apt-get install -y nodejs
EOF

  sleep 2
}

#######################################
# stop all services
# Arguments:
#   None
#######################################
wwebjs_stop_pm2() {
  print_banner
  printf "${WHITE} 💻 Agora, vamos para os serviços no deployplw...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployplw <<EOF
  pm2 stop all
EOF

  sleep 2
}

#######################################
# delete backend folder
# Arguments:
#   None
#######################################
wwebjs_delete_backend() {
  print_banner
  printf "${WHITE} 💻 Agora, vamos deletar as autenticações...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  cd /home/deployplw/zpro.io/backend || exit
  rm -rf .wwebjs_auth
  rm -rf .wwebjs_cache
EOF

  sleep 2
}

#######################################
# unzip update
# Arguments:
#   None
#######################################
wwebjs_upadte_api() {
  print_banner
  printf "${WHITE} 💻 Fazendo o update da biblioteca...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - deployplw <<EOF
  cd /home/deployplw/zpro.io/backend || exit
  npm r whatsapp-web.js
  npm install github:pedroslopez/whatsapp-web.js#webpack-exodus
EOF

  sleep 2
}

#######################################
# delete zip
# Arguments:
#   None
#######################################
wwebjs_reboot() {
  print_banner
  printf "${WHITE} 💻 Vamos reiniciar sua vps...${GRAY_LIGHT}"
  printf "\n\n"

  sleep 2

  sudo su - root <<EOF
  reboot
EOF

  sleep 2
}