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
rm ~/.perltidyrc
ln -s $SCRIPTDIR/perltidyrc ~/.perltidyrc

echo "Done!"
