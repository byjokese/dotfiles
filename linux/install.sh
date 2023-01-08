#!/bin/bash

# Script for installing al dev tool and languages
# 2022 | By-Jokese (byjokese.com)

# Update linux
echo "Updating linux..."
sudo apt-get update -y
sudo apt-get autoremove -y
sudo apt-get upgrade -y

# Essentials
echo "Installing essentials..."
sudo apt-get install -y \
  bash zsh sudo wget git g++ make gnupg gnupg2 ca-certificates lsb-release \
  vim nano libbrotli-dev cmake \
  tldr curl man \
  htop ncdu icdiff \
  unzip zip bzip2 p7zip-full \
  bat exa \
  lolcat ffmpeg

# Default Shell
sudo chsh -s $(which zsh)

# TLDR update
tldr -u

# Oh-my-zsh
echo "Installing oh-my-zsh & powerlevel10k theme..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
cp ~/dotfiles/linux/.zshrc >> ~/.zshrc
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
cp ~/dotfiles/linux/.p10k.zsh >> ~/.p10k.zsh

# Go install
echo "Installing go..."
wget --quiet https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
tar -xvf go1.18.1.linux-amd64.tar.gz
sudo mv go /usr/share
rm go1.18.1.linux-amd64.tar.gz

# Rust install
echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Deno install
echo "Installing deno..."
curl -fsSL https://deno.land/x/install/install.sh | sh

# Python install
echo "Installing python..."
sudo apt-get install -y python3 python3-pip python3-venv

# Node/nvm install
echo "Installing node/nvm..."
wget --quiet -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm
. ~/.zshrc
nvm install --lts
npm install -g svgo wipeclean ttf2woff @angular/cli

# Dotnet install
echo "Installing dotnet..."
wget https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get update
sudo apt-get install -y dotnet-sdk-6.0

# Docker install
echo "Installing docker..."
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update -y && sudo apt-get install docker-ce docker-ce-cli containerd.io -y
sudo usermod -aG docker $USER
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Woff2
echo "Installing and setting up woff2..."
git clone https://github.com/google/woff2.git
cd woff2
mkdir out
cd out
cmake ..
make && sudo make install
sudo cp woff2_* /usr/local/bin/
cd ..
cd ..
rm -rf woff2
