#!/bin/bash
#exec 2> ./errors.txt

# Script for prepare Debian
# 2022 | By-Jokese (byjokese.com)

export DEBIAN_FRONTEND=noninteractive

sudo echo "console-setup console-setup/codeset47 select" | debconf-set-selections
sudo echo "console-setup console-setup/codesetcode string Lat15" | debconf-set-selections
sudo echo "console-setup console-setup/fontface47 select VGA" | debconf-set-selections
sudo echo "console-setup console-setup/fontsize-text47 select 16" | debconf-set-selections
sudo echo "keyboard-configuration console-setup/ask_detect boolean false" | debconf-set-selections
sudo echo "console-setup console-setup/store_defaults_in_debconf_db boolean true" | debconf-set-selections
sudo echo "console-setup console-setup/charmap47 select UTF-8" | debconf-set-selections
sudo echo "console-setup console-setup/fontsize-fb47 select 16" | debconf-set-selections
sudo echo "keyboard-configuration console-setup/detected note" | debconf-set-selections
sudo echo "console-setup console-setup/fontsize string 16" | debconf-set-selections

sudo apt-get install -y console-setup keyboard-configuration kmod

# Update linux
echo "Updating linux..."
sudo apt-get update -y
sudo apt-get autoremove -y
sudo apt-get upgrade -y

# Essentials
echo "Installing essentials..."
sudo apt-get install -y \
  bash zsh zgen sudo wget git g++ make gnupg gnupg2 ca-certificates lsb-release \
  vim nano libbrotli-dev cmake \
  jq less catimg zoxide \
  tldr curl httpie man googler neofetch \
  htop ncdu icdiff \
  unzip zip bzip2 p7zip-full \
  locales locales-all \
  bat exa \
  sl lolcat cmatrix ffmpeg

# Fix batcat -> bat
echo "Applaying some fixes..."
sudo ln -s /usr/bin/batcat /usr/local/bin/bat

# TLDR update
tldr -u

# Oh-my-zsh
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
echo source $HOME/.dotfiles/.zshrc >> ~/.zshrc

PATH=$HOME/bin:/usr/local/bin:$HOME/.nvm:/usr/local/go/bin:$HOME/.deno/bin:$HOME/.cargo/bin:/usr/share/go/bin:$PNPM_HOME:$PATH

# Go install
echo "Installing go..."
wget --quiet https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
tar -xvf go1.18.1.linux-amd64.tar.gz
sudo mv go /usr/share
rm go1.18.1.linux-amd64.tar.gz

# Rust install
echo "Installing rust..."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Deno install
echo "Installing deno..."
curl -fsSL https://deno.land/x/install/install.sh | sh

# Python install
echo "Installing python..."
sudo apt-get install -y python3 python3-pip python3-venv

# Node/nvm install
echo "Installing node/nvm..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
source $HOME/.nvm/nvm.sh
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

# Change to ZSH
echo "Changing to ZSH..."
cp $HOME/.dotfiles/.zshrc $HOME/.zshrc
sudo chsh -s /usr/bin/zsh

zsh
