#!/bin/sh -x

sudo rm -rf $HOME/.dotfiles

git clone https://github.com/rhoriguchi/dotfiles.git $HOME/.dotfiles

sh $HOME/.dotfiles/init.sh
