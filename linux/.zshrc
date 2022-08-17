export ZSH="$HOME/.oh-my-zsh"

# Reload theme
source $ZSH/oh-my-zsh.sh

# Load plugins
source /usr/share/zgen/zgen.zsh
zgen load zsh-users/zsh-syntax-highlighting
zgen load zsh-users/zsh-autosuggestions
zgen load zsh-users/zsh-completions

source $HOME/.dotfiles/linux/.aliases

#Theme
source $HOME/powerlevel10k/powerlevel10k.zsh-theme

plugins=(git nvm npm python github docker colored-man-pages)

export PAGER="less"

# go
export GOPATH=/usr/share/go

# deno
export DENO_INSTALL=$HOME/.deno

# node
export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# zoxide
eval "$(zoxide init zsh)"
rm ~/.zcompdump*; compinit

# Load Angular CLI autocompletion.
source <(ng completion script)

# PATH
export PATH=$HOME/bin:/usr/games:/usr/local/bin:$HOME/.nvm:/usr/local/go/bin:$DENO_INSTALL/bin:$HOME/>

# Banner
bash $HOME/.dotfiles/linux/banner.sh
