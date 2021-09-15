# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

PS1='\[\033[0;32m\]\[\033[0m\033[0;32m\]\u\[\033[0;36m\] @ \[\033[0;36m\]\h \w\[\033[0;32m\]$(__git_ps1)\n\[\033[0;32m\]└─\[\033[0m\033[0;32m\]▶\[\033[0m\033[0;32m\] \$\[\033[0m\] '

function handle_notes {
    if [[ $1 = "save" ]]; then
	currentpwd=$PWD
	cd ~/personal/notes
	git commit -am "Notes save"
	git push origin main
	cd $currentpwd
    else
	vim ~/personal/notes/notes.md
    fi
}

alias venv="source ./venv/bin/activate && which python && python --version"
alias notes="handle_notes $1"
alias backup="~/backup_home.sh"
alias backup-clean="~/backup_home.sh --delete"
alias cp="cp -i"
alias mv="mv -i"
alias please=sudo
alias shit='sudo $(history -p !!)'

# git stuff
alias gs="git status"
alias gl="git log --oneline"

# pre-commit stuff
alias pc="pre-commit run --all-files"

## Pip
# Ensure that pip can only install to virtualenv's
export PIP_REQUIRE_VIRTUALENV=true

# Allow global override to install packages via pip
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Cache packages
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Sets image display to Windows through imagemagick and vcxsrv
# sudo apt install imagemagick
# Powershell admin: choco install vcxsrv
export DISPLAY=localhost:0.0

