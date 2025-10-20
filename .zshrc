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

# Set neovim as the default editor
export VISUAL="nvim"
export EDITOR="nvim"

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

# Change directory using yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}


