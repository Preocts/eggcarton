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

# Build a python venv if needed, otherwise activate existing
build_venv () {
   if [ ! -d "venv/" ] ; then
        python3 -m venv venv
        . venv/bin/activate
        python -m pip install pip
    fi
    if [ "$(type -t deactivate)" != "function" ] ; then
        . venv/bin/activate
    fi
    which python
    python --version
}

# Create a new python module project, only if directory is empty
build_python_project() {
    if [ ! -z "$(ls -A)" ] ; then
        echo "Directory is not empty, are you sure this is the place?"
        return 1
    fi
    if [ ! -z $@ ] && [ "$@" = "src" ] ; then
        git clone https://github.com/preocts/python-src-template .
    else
        git clone https://github.com/preocts/python-module-template .
    fi
    if [ $? -ne 0 ]; then
        echo "Failed."
        return $?
    fi
    rm -rf .git
    git init
    git checkout -b main
    build_venv
    make && make install-dev
}


alias venv=build_venv
alias python-setup=build_python_project $1
alias backup="~/backup_home.sh"
alias backup-clean="~/backup_home.sh --delete"
alias cp="cp -i"
alias mv="mv -i"
alias shit='sudo $(history -p !!)'
alias neil="cowsay Write down everything that happens in the story, and then in your second draft make it look like you knew what you were doing all along. - Neil Gaiman"

# git stuff
alias gs="git status"
alias gl="git log --oneline"

# pre-commit stuff
alias pc="pre-commit run --all-files"

## Python REPL
export PYTHONSTARTUP=~/.python_repl.py

## Pip
# Ensure that pip can only install to virtualenv's
export PIP_REQUIRE_VIRTUALENV=true

# Allow global override to install packages via pip
gpip() {
    PIP_REQUIRE_VIRTUALENV="" pip "$@"
}

# Cache packages
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

