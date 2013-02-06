#!/bin/bash

pushd `dirname $0` >/dev/null
SCRIPTDIR=`pwd -P`
popd >/dev/null

echo "Setting up vim..."
rm -rf ~/.vimrc ~/.vim
ln -s $SCRIPTDIR/vimrc ~/.vimrc
ln -s $SCRIPTDIR/vim ~/.vim

echo "Setting up screen..."
rm ~/.screenrc
ln -s $SCRIPTDIR/screenrc ~/.screenrc

echo "Setting up perltidy..."
if [[ -e ~/.perltidyrc ]]; then
    rm ~/.perltidyrc;
fi
ln -s $SCRIPTDIR/perltidyrc ~/.perltidyrc

if [[ !(-e ~/.bashrc) || $(grep -E "source $SCRIPTDIR/bashrc" ~/.bashrc | wc -l) == 0 ]]; then
    echo "Setting up bashrc...";
    echo "" >> ~/.bashrc;
    echo "# Source in the dot-files bashrc" >> ~/.bashrc;
    echo "source $SCRIPTDIR/bashrc" >> ~/.bashrc;
else
    echo "Bashrc already being sourced..."
fi

echo "Done!"
