#!/bin/sh -x

sudo apt update && sudo apt install -y \
  git \
  stow

sudo rm -rf $HOME/.dotfiles

git clone https://github.com/rhoriguchi/dotfiles.git $HOME/.dotfiles

sh $HOME/.dotfiles/init.sh
