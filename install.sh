#!/bin/bash

clear

echo This will remove the current .vimrc, creating a backup of your
echo current .vimrc is recommended.
read -p "Are you sure you want to continue? CTRL+C to cancel" silly

rm $HOME/.vimrc
cp ./.vimrc $HOME/.vimrc

mkdir -p ~/.vim/colors/
cp ./colors/* ~/.vim/colors/

read -p "Are you also using Neovim? [y/n] " type

if [[ $type == "y" ]] then
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    rm $HOME/.config/nvim/init.vim
    mkdir -p $HOME/.config/nvim/
    cp ./init.vim $HOME/.config/nvim/init.vim
fi
if [[ $type == "n" ]] then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
fi

echo
echo Done! Please run 'vim' or 'nvim' inside your terminal and run ':PlugInstall'
echo
read -p "Do you want to see some basic shortcuts? CTRL+C to cancel" silly
./bhelp.sh
