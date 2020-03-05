#!/bin/bash

set -x

sudo apt update && sudo apt install -y \
  git \
  stow

git clone https://github.com/rhoriguchi/dotfiles.git $HOME/.dotfiles

cd $HOME/.dotfiles && sh init.sh ; cd $OLDPWD
