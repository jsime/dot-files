#!/bin/bash

pushd `dirname $0` >/dev/null
SCRIPTDIR=`pwd -P`
popd >/dev/null

echo "Setting up dircolors..."
if [[ -e ~/.dir_colors ]]; then
    rm -rf ~/.dir_colors;
fi
ln -s $SCRIPTDIR/dir_colors ~/.dir_colors

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

echo "Setting up gitconfig..."
if [[ -e ~/.gitconfig ]]; then
    rm ~/.gitconfig;
fi
ln -s $SCRIPTDIR/gitconfig ~/.gitconfig

echo "Setting up gntrc..."
if [[ -e ~/.gntrc ]]; then
    rm ~/.gntrc;
fi
ln -s $SCRIPTDIR/gntrc ~/.gntrc

if [[ !(-e ~/.bashrc) || $(grep -E "source $SCRIPTDIR/bashrc" ~/.bashrc | wc -l) == 0 ]]; then
    echo "Setting up bashrc...";
    echo "" >> ~/.bashrc;
    echo "# Source in the dot-files bashrc" >> ~/.bashrc;
    echo "source $SCRIPTDIR/bashrc" >> ~/.bashrc;
else
    echo "Bashrc already being sourced..."
fi

echo "Setting up gtkrc..."
if [[ -e ~/.gtkrc-2.0.mine ]]; then
    rm ~/.gtkrc-2.0.mine;
fi
ln -s $SCRIPTDIR/gtkrc-2.0 ~/.gtkrc-2.0.mine

echo "Setting up irssi..."
if [[ -d ~/.irssi ]]; then
    rm -rf ~/.irssi;
fi
ln -s $SCRIPTDIR/irssi ~/.irssi

echo "Setting up weechat..."
if [[ -d ~/.weechat ]]; then
    rm -rf ~/.weechat
fi
ln -s $SCRIPTDIR/weechat ~/.weechat

echo "Setting up moc..."
if [[ -d ~/.moc ]]; then
    rm -rf ~/.moc;
fi
ln -s $SCRIPTDIR/moc ~/.moc

echo "Setting up xmonad..."
if [[ -d ~/.xmonad ]]; then
    if [[ -d ~/.xmonad/startup.d ]]; then
        rm -rf ~/.xmonad/startup.d;
    fi
    if [[ -e ~/.xmonad/xmonad.hs ]]; then
        rm -f ~/.xmonad/xmonad.hs;
    fi
else
    mkdir ~/.xmonad
fi
ln -s $SCRIPTDIR/xmonad/xmonad.hs ~/.xmonad/xmonad.hs
ln -s $SCRIPTDIR/xmonad/startup.d ~/.xmonad/startup.d

echo "Setting up Xresources..."
if [[ -e ~/.Xresources ]]; then
    rm ~/.Xresources
fi
ln -s $SCRIPTDIR/Xresources ~/.Xresources

echo "Setting up xsession..."
if [[ -e ~/.xsession ]]; then
    rm ~/.xsession
fi
ln -s $SCRIPTDIR/xsession ~/.xsession

if [[ (-d ~/proj/bin-scripts) && !(-e ~/bin) ]]; then
    echo "Linking ~/bin to bin-scripts repo...";
    ln -s ~/proj/bin-scripts ~/bin;
fi

echo "Done!"
