# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME=""
autoload -U promptinit; promptinit
prompt pure

plugins=(
  git
)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

alias vim="nvim"
alias p="python3"
alias y="yt-dlp"
alias lg="lazygit"
alias cr="cat ~/.copyright | pbcopy"

# Pants
alias pflc="pants fix lint check"
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
