#!/bin/bash

clear

echo This will remove the current .vimrc, creating a backup of your
echo current .vimrc is recommended.
read -p "Are you sure you want to continue? CTRL+C to cancel" silly

rm $HOME/.vimrc
cp ./.vimrc $HOME/.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo
echo Done! Please run 'vim' inside your terminal and run ':PlugInstall' inside vim
echo
read -p "Do you want to see some basic shortcuts? CTRL+C to cancel" silly
./tutorial.sh
