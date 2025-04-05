# ~/.zshrc
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

###############################################################################
# Ensure local user bin is in $PATH
###############################################################################

export PATH="$HOME/.local/bin:$PATH"

###############################################################################
# Initialize various tools
###############################################################################

# Zoxide
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
else
  echo "zoxide is not installed."
fi

# fzf (loads keybindings and completion)
if command -v fzf &> /dev/null; then
  source <(fzf --zsh)
else
  echo "fzf is not installed."
fi

# Starship
if command -v starship &> /dev/null; then
  eval "$(starship init zsh)"
else
  echo "Starship is not installed."
fi

# fnm (Fast Node Manager)
FNM_PATH="$HOME/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  # Set up fnm for Zsh with "use on cd"
  eval "$(fnm env --use-on-cd --shell zsh)"
fi

###############################################################################
# Aliases
###############################################################################

alias ls='eza --color-scale --icons'
alias la='eza -a --color-scale --icons'
alias ll='eza -l --color-scale --icons --git'
alias lla='eza -la --color-scale --icons --git'
alias lS='eza -1'     # One column, just names
alias lt='eza --tree --level=2'

alias please='sudo'
alias sorry='git push --force-with-lease'
alias iknowwhatiamdoing='git push --force && echo "Do you though?"'
alias fine='git commit --amend --no-edit --force'
alias save-point='git add -A && git commit -m "SAVEPOINT: $(date)" && echo "Progress saved. Keep coding!"'

alias g='git'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gd='git diff'
alias gs='git status'
alias gl='git log --oneline --graph --decorate'
alias gpl='git pull'
alias gps='git push'

alias cat='bat'

alias python='python3'

###############################################################################
# paths
###############################################################################
# Rust
export PATH="$HOME/.cargo/bin:$PATH"