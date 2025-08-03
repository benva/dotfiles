#!/bin/bash

# zsh
cp ~/.zshrc ~/dotfiles/.zshrc

# git
cp ~/.gitconfig ~/dotfiles/.gitconfig

# neovim
cp -R ~/.config/nvim/ ~/dotfiles/nvim/

# lazygit
cp ~/Library/Application\ Support/lazygit/config.yml ~/dotfiles/lazygit/config.yml

# kitty
cp -R ~/.config/kitty/ ~/dotfiles/kitty/

cp -R ~/.config/aerospace/ ~/dotfiles/aerospace/

# yazi
cp -R ~/.config/yazi/ ~/dotfiles/yazi/

echo "Finished update!"
