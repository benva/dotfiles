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

# Most used directories
eval "$(fasd --init zsh-hook)"
function z {
  if  selected=$(fasd -dlR | fzf --no-sort --height 10%)  ; then
      cd $selected
  fi
}

# Stretching
function s {
  source ~/.day

  mpv ~/Movies/"$DAY"*.mp4

  NEXT_DAY=$(((DAY + 1) % 3))
  echo "DAY=$NEXT_DAY" > .day

  echo "I hope you had a good stretch!"
}
