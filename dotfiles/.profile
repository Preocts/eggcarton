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
        python -m pip install --upgrade pip
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
    git clone https://github.com/preocts/python-src-template .
    if [ $? -ne 0 ]; then
        echo "Failed."
        return $?
    fi
    rm -rf .git
    git init
    git checkout -b main
    build_venv
}

randomize_timezone() {
    tz=$(find /usr/share/zoneinfo/Etc -name 'GMT-*' | shuf -n 1 | grep -o "Etc/.*")
    echo "Setting timezone to random choice: $tz"
    export TZ=$tz
}

alias brag="(cd ~ && python3 ~/braghook.py)"
alias venv=build_venv
alias python-setup=build_python_project
alias backup="~/.backup_home.sh"
alias backup-clean="~/.backup_home.sh --delete"
alias cp="cp -i"
alias mv="mv -i"
alias neil="cowsay Write down everything that happens in the story, and then in your second draft make it look like you knew what you were doing all along. - Neil Gaiman"
alias randomtz="randomize_timezone"
alias resettz="unset TZ"

# git stuff (removed)
alias gs="echo go gs yourself there buddy..."
alias gl="echo glhv with that old alias..."

# pre-commit stuff
alias pc="pre-commit run --all-files"

## Python REPL
export PYTHONSTARTUP=~/.python_repl.py

## Pip
# Ensure that pip can only install to virtualenv's
export PIP_REQUIRE_VIRTUALENV=true

# Allow global override to install packages via pip
gpip() {
    PIP_REQUIRE_VIRTUALENV="" python3 -m pip "$@"
}

# Cache packages
export PIP_DOWNLOAD_CACHE=$HOME/.pip/cache

# Golang setup
export GOROOT=$HOME/.local/bin/go
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# 1Password SSH Auth Bridge
export SSH_AUTH_SOCK=$HOME/.ssh/agent.sock
ALREADY_RUNNING=$(ps -auxww | grep -q "[n]piperelay.exe -ei -s //./pipe/openssh-ssh-agent"; echo $?)
if [[ $ALREADY_RUNNING != "0" ]]; then
    if [[ -S $SSH_AUTH_SOCK ]]; then        echo "removing previous socket..."
        rm $SSH_AUTH_SOCK
    fi
    echo "Starting SSH-Agent relay..."
    (setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork &) >/dev/null 2>&1
fi

neil
. "$HOME/.cargo/env"
