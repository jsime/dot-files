#!/bin/bash

echo "Setting up vim..."
rm -rf ~/.vimrc ~/.vim
ln -s ./vimrc ~/.vimrc
ln -s ./vim ~/.vim

echo "Setting up screen..."
rm ~/.screenrc
ln -s ./screenrc ~/.screenrc

echo "Done!"
