#!/usr/bin/env bash

set -ex

sudo apt update && sudo apt install -y \
  git \
  stow

git clone https://github.com/rhoriguchi/dotfiles.git ~/.dotfiles

pushd ~/.dotfiles && sh init.sh && popd
