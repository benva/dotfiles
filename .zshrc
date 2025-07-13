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

# Keep track of most visited directories
eval "$(fasd --init zsh-hook)"

# Fuzzy find most used directories
z() {
  local selected

  if selected=$(fasd -dlR | fzf --no-sort --height 10% --reverse) ; then
    cd "$selected"
  fi
}

# Fuzzy find processes to kill
pk() {
  local selected pid_list

  selected=$(lsof -nP -iTCP -sTCP:LISTEN | fzf --multi) || return 0
  pid_list=$(printf '%s\n' "$selected" | awk '{ print $2 }')

  if [ -n "$pid_list" ]; then
    printf '%s\n' "$pid_list" | xargs --no-run-if-empty kill -9
  fi
}
