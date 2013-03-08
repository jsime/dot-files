#!/bin/bash

pushd `dirname $0` >/dev/null
SCRIPTDIR=`pwd -P`
popd >/dev/null

echo "Setting up vim..."
rm -rf ~/.vimrc ~/.vim
ln -s $SCRIPTDIR/vimrc ~/.vimrc
ln -s $SCRIPTDIR/vim ~/.vim

echo "Setting up screen..."
if [[ -e ~/.screenrc ]]; then
    rm ~/.screenrc;
fi
ln -s $SCRIPTDIR/screenrc ~/.screenrc

echo "Setting up perltidy..."
if [[ -e ~/.perltidyrc ]]; then
    rm ~/.perltidyrc;
fi
ln -s $SCRIPTDIR/perltidyrc ~/.perltidyrc

echo "Setting up psql..."
if [[ -e ~/.psqlrc ]]; then
    rm ~/.psqlrc;
fi
ln -s $SCRIPTDIR/psqlrc ~/.psqlrc

echo "Setting up tmux..."
if [[ -e ~/.tmux.conf ]]; then
    rm ~/.tmux.conf;
fi
ln -s $SCRIPTDIR/tmux.conf ~/.tmux.conf

if [[ !(-e ~/.bashrc) || $(grep -E "source $SCRIPTDIR/bashrc" ~/.bashrc | wc -l) == 0 ]]; then
    echo "Setting up bashrc...";
    echo "" >> ~/.bashrc;
    echo "# Source in the dot-files bashrc" >> ~/.bashrc;
    echo "source $SCRIPTDIR/bashrc" >> ~/.bashrc;
else
    echo "Bashrc already being sourced..."
fi

if [[ (-d ~/proj/bin-scripts) && !(-e ~/bin) ]]; then
    echo "Linking ~/bin to bin-scripts repo...";
    ln -s ~/proj/bin-scripts ~/bin;
fi

echo "Done!"
