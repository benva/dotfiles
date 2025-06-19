# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Theme
ZSH_THEME=""
autoload -U promptinit; promptinit
prompt pure

# Plugins
plugins=(
  git
  zsh-autosuggestions
  pyenv-lazy
)

# This has to occur after initializing plugins
source $ZSH/oh-my-zsh.sh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Personal aliases
alias vim="nvim"
alias lg="lazygit"
alias pk="lsof -i -P -n | grep LISTEN | fzf --multi | awk '{print $2}' | xargs kill -9"

# Most used directories
eval "$(fasd --init zsh-hook)"
function z {
  if  selected=$(fasd -dlR | fzf --no-sort --height 10%)  ; then
    cd $selected
  fi
}
