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

# Set up fzf for terminal fuzzy finding and keybindings
source <(fzf --zsh)
export FZF_DEFAULT_OPTS='--reverse'

# Aliases
alias vim="nvim"
alias lg="lazygit"
alias pk="lsof -i -P -n | grep LISTEN | fzf --multi | awk '{print $2}' | xargs kill -9"

# Keep track of most visited directories
eval "$(fasd --init zsh-hook)"

# Fuzzy find most used directories
z() {
  local selected

  if selected=$(fasd -dlR | fzf --no-sort --height 10% --reverse) ; then
    cd "$selected"
  fi
}
