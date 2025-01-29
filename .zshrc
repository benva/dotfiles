# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
# export DEFAULT_USER="$(whoami)"
ZSH_THEME=""
autoload -U promptinit; promptinit
prompt pure

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh


alias vim="nvim"
alias p="python3"
alias y="yt-dlp"

# Docker
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dce="docker compose exec"
alias dps="docker ps -a"

# Pants
alias pf="pants fix"
alias plc="pants lint check"
alias pt="pants test"

# Most used directories
eval "$(fasd --init zsh-hook)"
function z {
  if  selected=$(fasd -dlR | fzf --no-sort --height 10%)  ; then
    cd $selected
  fi
}

# pyenv
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"
