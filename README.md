# By-Jokese dotfiles

Script to prepare your GNU/Linux terminal (WSL also) in a «superterminal» with modern, autocompleted commands and other features.

## Includes

- **Shell**: ZSH + OH-MY-ZSH + Custom Theme
- **Plugins**: Zgen plugin manager + History & Red/green completion commands
- **Essentials tools**: wget + git + make + cmake + g++
- **CLI Editors**: vim + nano
- **CLI tools**: ccze + jq
- **API/Request tools**: curl + http + googler
- **Help/Info**: man + tldr + neofetch
- **Fun**: sl + lolcat + wipeclean + cmatrix
- **Compressors/conversors**: unzip + zip + bzip2 + p7zip + svgo + ttf2woff + woff2 + ffmpeg
- **Language + Package Managers**: Go + Deno + Node/NVM/PNPM
- **Containers**: Docker

| **Modern commands** |
|-|
| bat (cat) |
| exa (ls, tree) |
| glow (cat .md) |
| jless (cat .json) |
| catimg (image cat) |
| duf (df) |
| ncdu (du) |
| zoxide (cd) |
| htop (top) |
| icdiff (diff) |
| hyperfine (time) |

## Requisites

If you haven't a non-root user with sudo privileges, create it before run this script:

```bash
adduser byjokese --gecos ""
usermod -aG sudo byjokese
apt-get update -y && apt-get install -y sudo git
su byjokese
```

## Installation

```bash
git clone https://github.com/byjokese/dotfiles ~/.dotfiles
cd ~/.dotfiles/linux
bash install.sh
```

* Note: Do not run as root/sudo this file!

If running the system for first time run `pre-install.sh` script before `install.sh` as root user and then switch to your user for `install.sh`.

```bash
bash pre-install.sh
```

Linux section, inspired from https://github.com/ManzDev/dotfiles
