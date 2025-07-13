#!/bin/bash

# ========================
# HOMEBREW PACKAGES
# ========================
echo "Installing homebrew packages"

# Install homebrew if it isn't already
if ! command -v brew >/dev/null 2>&1; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

brew install bat \
  fd \
  fzf \
  gh \
  git \
  git-delta \
  lazygit \
  neovim \
  neovim-remote \
  node \
  pure \
  pyenv \
  ripgrep \
  zsh

brew install --cask nikitabobko/tap/aerospace \
  font-jetbrains-mono-nerd-font \
  kitty \
  raycast 

# ========================
# OTHER PACKAGES
# ========================
echo "Installing other packages"

# Install fasd if it isn't already
if ! command -v fasd >/dev/null 2>&1; then
  git clone https://github.com/whjvenyl/fasd.git
  cd fasd
  sudo make install
  cd ..
  rm -rf fasd
fi

# ========================
# ZSH PLUGINS
# ========================
echo "Installing zsh plugins"

# Install oh my zsh if it isn't already
if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/davidparsson/zsh-pyenv-lazy.git ~/.oh-my-zsh/custom/plugins/pyenv-lazy

# ========================
# CONFIG FILES
# ========================
echo "Copying config files"

# zsh
cp ~/dotfiles/.zshrc ~/.zshrc

# git
cp ~/dotfiles/.gitconfig ~/.gitconfig

# neovim
mkdir -p ~/.config/nvim
cp -R ~/dotfiles/nvim/ ~/.config/nvim/

# lazygit
mkdir -p ~/Library/Application\ Support/lazygit
cp ~/dotfiles/lazygit/config.yml ~/Library/Application\ Support/lazygit/config.yml

# kitty
mkdir -p ~/.config/kitty
cp -R ~/dotfiles/kitty/ ~/.config/kitty/

# aerospace
mkdir -p ~/.config/aerospace
cp -R ~/dotfiles/aerospace/ ~/.config/aerospace/

echo "Finished setup!"
