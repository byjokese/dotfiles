# By-Jokese's dotfiles

Script to prepare your GNU/Linux terminal (WSL compatible) in a «superterminal» with modern, autocompleted commands and other features.

MacOS script in development.

## Table of Contents

1. [What It Installs](#what-it-installs)
2. [Prerequisites](#prerequisites)
3. [Usage](#usage)
4. [Post-Install Notes](#post-install-notes)

## What It Installs

1. **Core Dependencies & System Tools**
   - **zsh** (with **zsh-autosuggestions** and **zsh-syntax-highlighting**)
   - **git** (via the official Git PPA)
   - **eza**, **bat**, **tmux**, **tldr**, **btop**, **nmap**, **ripgrep**, **ncdu**, **jq**
   - Basic compilers/build tools: `build-essential`, `cmake`, `ninja-build`, `autoconf`, `automake`, `pkg-config`, etc.
2. **Zsh Setup**
   - Removes old Bash files (`.bashrc`, `.bash_profile`, etc.)
   - Sets **Zsh** as the default login shell.
3. **Fastfetch**
   - A command-line tool to quickly display system info (OS, hardware, etc.).
4. **zoxide**
   - A smarter `cd` command for fast directory navigation.
5. **Starship**
   - A minimal, blazing-fast shell prompt.
6. **fnm (Fast Node Manager)**
   - A lightweight Node.js version manager.
7. **Lazydocker**
   - A simple terminal UI for Docker and docker-compose.
8. **Glow**
   - A terminal-based Markdown reader (installed from Charm’s apt repo).
9. **Lazygit**
   - A simple terminal UI for Git, installed from GitHub releases.
10. **FiraCode Nerd Fonts**
    - Popular programming fonts with icons, copied into `~/.local/share/fonts`.
11. **FZF**
    - A command-line fuzzy finder, installed in **unattended** mode.
12. **Neovim** (from source)
    - Latest stable Neovim built from the official GitHub source.
13. **Docker**
    - Docker Engine (`docker-ce`), CLI (`docker-ce-cli`), containerd, Buildx plugin, and Compose plugin, from the official Docker repository.
14. **Rust**
    - Installed via the official Rustup script in non-interactive mode (`-y`).
15. **Custom Config & Dotfiles**
    - Copies `.config` files from this repo into your `~/.config`.
    - Replaces `~/.zshrc` with one from the script and sources it immediately.

## Prerequisites

- A **Debian/Ubuntu-based** Linux distribution (e.g., Ubuntu, Linux Mint, Pop!_OS).
- **sudo** privileges (the script installs system packages).
- **Internet connection** for downloading packages and source code.


## Usage

1. **Clone** or **download** this repository to your machine.
2. Make the script executable
3. Run the script
4. If prompted, enter your sudo password.

```bash
   git clone https://github.com/byjokese/dotfiles ~/.dotfiles
   cd ~/.dotfiles
   chmod +x install-on-linux.sh
   ./install-on-linux.sh
```
⚠️ Note: Do not run as root/sudo this file!

The script will:
- Update and install packages.
- Set up Zsh as your default shell.
- Clone/build Neovim from source.
- Install Docker, Rust, fonts, etc.
- Copy configuration files and remove old Bash files.

## Requisites

Git is required to be able to clone the repo, the rest should be automatically configured by the install script.

```bash
apt-get update -y && apt-get install -y sudo git
```

