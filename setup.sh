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

if [[ !(-e ~/.bash_profile) || $(grep -E 'source.*bashprofile' ~/.bash_profile | wc -l) == 0 ]]; then
    echo "Setting up bash_profile...";
    echo "source $SCRIPTDIR/bashprofile" >> ~/.bash_profile;
fi

echo "Done!"
