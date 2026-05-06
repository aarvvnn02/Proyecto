#!/bin/bash

echo "📦 Actualizando sistema..."
sudo apt update -y

echo "🐳 Instalando Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

echo "🐙 Instalando Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" \
-o /usr/local/bin/docker-compose

sudo chmod +x /usr/local/bin/docker-compose

echo "📁 Accediendo al proyecto..."
cd /vagrant

echo "🚀 Levantando contenedores..."
sudo docker-compose up -d

echo "🔄 Actualizando repositorio Git..."
if [ ! -d src/.git ]; then
  git clone https://github.com/TU_USUARIO/TU_REPO.git src
else
  cd src && git pull origin main
fi

echo "✅ Sistema listo"
