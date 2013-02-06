# Don't process these customizations if the shell is non-interactive
[[ $- != *i* ]] && return

# append history, don't overwrite it, log only uniques, and don't log some of common commands
shopt -s histappend
export HISTIGNORE="&:[ ]*:exit"

function ps1_vc {
    BRANCH=$(git branch 2>/dev/null | grep "^\*" | cut -c3-)
    if [[ $BRANCH ]]; then
        echo -n "git: $BRANCH";
    else
        BRANCH=$(svn info 2>/dev/null | grep 'Repository Root' | tr '/' "\n" | tail -2 | tr "\n" '/' | sed -e 's/\/$//')
        if [[ $BRANCH ]]; then
            echo -n "svn: $BRANCH";
        else
            echo -n "✗";
        fi
    fi
    BRANCH=""
}

export PS1="\e[1;34m\342\224\214(\e[0;36m\$(date +\"%H:%M %Z\")\e[1;34m)\e[0m\
\e[1;34m\342\224\200(\e[0;36m\$(ps1_vc)\e[1;34m)\e[0m\
\e[1;34m\342\224\200(\e[0;36m\w\e[1;34m)\e[0m\n\
\e[1;34m\342\224\224\342\224\200\342\224\200\e[0m\
\e[1;34m(\e[0;33m${debian_chroot:+($debian_chroot)}\u\e[1;30m@\e[0;33m\h\e[1;34m) \e[1;30m\$\e[0m "

