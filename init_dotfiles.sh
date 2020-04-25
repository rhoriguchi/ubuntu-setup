#!/usr/bin/env bash

set -ex

sudo apt update && sudo apt install -y \
  git \
  stow

sudo rm -rf ~/.dotfiles
git clone https://github.com/rhoriguchi/dotfiles.git ~/.dotfiles

pushd ~/.dotfiles && sh init.sh && popd

chsh -s $(which zsh)
