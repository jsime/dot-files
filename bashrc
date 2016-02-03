# Don't process these customizations if the shell is non-interactive
[[ $- != *i* ]] && return

export EDITOR="vim"
export PAGER="less"
export LESS=' -FRSX '

# for various bluetooth shenanigans, having the device path is handy
export BLUEPATH="/org/bluez/$(pidof bluetoothd)/hci1"

# set readline mode to Vi style, instead of the default emacs mode
set -o vi

# append history, don't overwrite it, log only uniques, and don't log some of common commands
shopt -s histappend
export HISTIGNORE="&:[ ]*:exit"

# if we have the source-highlight package installed, modify less to use it
if [[ -f /usr/share/source-highlight/src-hilite-lesspipe.sh ]]; then
    export LESSOPEN="| /usr/share/source-highlight/src-hilite-lesspipe.sh %s"
fi

# alias irssi to a command which makes sure the config is up to date
alias irssi="cat ~/.irssi/config.base ~/.private/irssi > ~/.irssi/config && /usr/bin/irssi"

# alias 'vbm' to VBoxManage because camel-cased command names are treasonous
alias vbm="VBoxManage"
alias vbmr="VBoxManage list runningvms"

# alias the brightness command to run with the full path (so we can whitelist it in sudo)
alias bright="sudo /home/jsime/bin/brightness"

# alias 'lh' to a long ls with human readable sizes
alias lh='ls -laFh'

# shorthand for verbose process listing in standard syntax (pse) and BSD syntax (psa)
alias pse='ps -elfy'
alias psa='ps aux'

# ansible shortcuts
alias ap='ansible-playbook'

function ps1_vc {
    BRANCH=$(git branch 2>/dev/null | grep "^\*" | cut -c3-)
    if [[ $BRANCH ]]; then
        echo "[git: $BRANCH] ";
    else
        BRANCH=$(svn info 2>/dev/null | grep 'Repository Root' | tr '/' "\n" | tail -2 | tr "\n" '/' | sed -e 's/\/$//')
        if [[ $BRANCH ]]; then
            echo "[svn: $BRANCH] ";
        else
            BRANCH=$(hg branch 2>/dev/null)
            if [[ $BRANCH ]]; then
                echo "[hg: $BRANCH] ";
            fi
        fi
    fi
    BRANCH=""
}

PS1="[\[\e[33m\]\D{%H:%M %Z}\e[0m\]]⠒["
if [[ ${EUID} == 0 ]]; then
    PS1="$PS1\[\e[31m\]\u"
else
    PS1="$PS1\[\e[32m\]\u"
fi
PS1="$PS1\[\e[33m\]@\[\e[32m\]\h\[\e[0m\]:\[\e[35;1m\]\w\[\e[0m\]]\n"
PS1="$PS1\[\e[34m\]\$(ps1_vc)\[\e[0m\]\[\e[31m\]\$?:\[\e[0m\]"
PS1="$PS1\[\e[31;1m\]λ\[\e[0m\] "
export PS1

# Make sure our local bin/ is in the PATH
if [[ ! ":$PATH:" == *":$HOME/bin:"* ]]; then
    export PATH="$HOME/bin:$PATH"
fi

# If we've installed SBCL to /opt/sbcl here, make sure SBCL_HOME is set properly
if [[ -d /opt/sbcl ]]; then
    export SBCL_HOME=/opt/sbcl/lib/sbcl/
    if [[ ! ":$PATH:" == *":/opt/sbcl/bin:"* ]]; then
        export PATH="$PATH:/opt/sbcl/bin"
    fi
fi

# Add VMWare to the path if we've installed it on this machine
if [[ ! ":$PATH:" == *":/opt/vmware/bin:"* ]]; then
    if [[ -d /opt/vmware ]]; then
        export PATH="$PATH:/opt/vmware/bin"
    fi
fi

# import local dir colors settings
if [[ -e $HOME/.dir_colors ]]; then
    eval `dircolors -b $HOME/.dir_colors`
fi

# if here's a Perlbrew setup here, source it
if [[ -e $HOME/perl5/perlbrew/etc/bashrc ]]; then
    source $HOME/perl5/perlbrew/etc/bashrc
fi

# similarly, source GVM environment if we have that installed
if [[ -e $HOME/.gvm/scripts/gvm ]]; then
    source /home/jsime/.gvm/scripts/gvm
fi

# if we've got Packer installed on this machine, add it to our PATH
if [[ ! ":$PATH:" == *":/usr/local/packer:"* ]]; then
    if [[ -d /usr/local/packer ]]; then
        export PATH="$PATH:/usr/local/packer"
    fi
fi
