#!/usr/bin/env bash

# === Colors ===
# \e[1;32m = Bold Green
# \e[1;33m = Bold Yellow
# \e[1;34m = Bold Blue
# \e[1;35m = Bold Magenta
# \e[1;36m = Bold Cyan
# \e[0m    = Reset color

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &> /dev/null && pwd)"

echo -e "\n\e[1;36m=== STEP: Updating packages and installing core dependencies ===\e[0m"
sudo add-apt-repository -y ppa:git-core/ppa
sudo apt update && \
sudo apt install -y \
  zsh zsh-autosuggestions zsh-syntax-highlighting \
  git eza bat tmux tldr btop nmap ripgrep ncdu jq \
  ca-certificates curl wget unzip zip build-essential ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config

echo -e "\n\e[1;36m=== STEP: Linking batcat to bat ===\e[0m"
ln -s /usr/bin/batcat ~/.local/bin/bat

echo -e "\n\e[1;36m=== STEP: Removing ~/.bashrc and switching default shell to Zsh ===\e[0m"
chsh -s /usr/bin/zsh
rm -f ~/.bashrc ~/.bash_profile ~/.bash_login ~/.profile ~/.bash_logout ~/bash_history

echo -e "\n\e[1;36m=== STEP: Installing Fastfetch from PPA ===\e[0m"
sudo add-apt-repository -y ppa:zhangsongcui3371/fastfetch
sudo apt update
sudo apt install -y fastfetch

echo -e "\n\e[1;36m=== STEP: Installing zoxide ===\e[0m"
curl -sSfL https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | sh

echo -e "\n\e[1;36m=== STEP: Installing Starship ===\e[0m"
curl -sS https://starship.rs/install.sh | sh -s -- --yes

echo -e "\n\e[1;36m=== STEP: Installing fnm (Fast Node Manager) ===\e[0m"
curl -fsSL https://fnm.vercel.app/install | bash

echo -e "\n\e[1;36m=== STEP: Installing Lazydocker ===\e[0m"
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

echo -e "\n\e[1;36m=== STEP: Installing Glow from Charm's apt repo ===\e[0m"
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://repo.charm.sh/apt/gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/charm.gpg
echo "deb [signed-by=/etc/apt/keyrings/charm.gpg] https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
sudo apt update
sudo apt install -y glow

echo -e "\n\e[1;36m=== STEP: Installing the latest Lazygit release ===\e[0m"
cd /tmp
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
lazygit --version

echo -e "\n\e[1;36m=== STEP: Installing FiraCode Nerd Fonts ===\e[0m"
cd /tmp
mkdir -p ~/.local/share/fonts
if [ ! -d "nerd-fonts" ]; then
  git clone --filter=blob:none --sparse https://github.com/ryanoasis/nerd-fonts
  cd nerd-fonts
else
  cd nerd-fonts
  git fetch --all
  git pull
fi
git sparse-checkout add patched-fonts/FiraCode
cd patched-fonts/FiraCode/
find . -name "*.ttf" -exec cp {} ~/.local/share/fonts/ \;

echo -e "\n\e[1;36m=== STEP: Cloning (or updating) FZF ===\e[0m"
cd /tmp
if [ ! -d ~/.fzf ]; then
  # Full clone of FZF
  git clone https://github.com/junegunn/fzf.git ~/.fzf
else
  cd ~/.fzf
  git pull
fi
~/.fzf/install --all --no-bash

echo -e "\n\e[1;36m=== STEP: Cloning (or updating) and building Neovim from source ===\e[0m"
cd /tmp
if [ ! -d neovim ]; then
  git clone https://github.com/neovim/neovim.git
  cd neovim
else
  cd neovim
  git fetch --all
  git pull
fi
git checkout stable
make CMAKE_BUILD_TYPE=Release
sudo make install

echo -e "\n\e[1;36m=== STEP: Installing Docker ===\e[0m"
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo \"${UBUNTU_CODENAME:-$VERSION_CODENAME}\") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo -e "\n\e[1;33m=== STEP: Installing Development languages ===\e[0m"
echo -e "\n\e[1;33m=== STEP: Installing Rust ===\e[0m"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

echo -e "\n\e[1;35m=== STEP: Setup profile and config files ===\e[0m"
cp -rf $SCRIPT_DIR/.config ~/.config
cp -rf $SCRIPT_DIR/.zshrc ~/.zshrc
source ~/.zshrc
rm -f ~/.bashrc ~/.bash_profile ~/.bash_login ~/.profile ~/.bash_logout ~/bash_history

echo -e "\n\e[1;32m=== All steps completed successfully! Please restart your terminal. ===\e[0m"
