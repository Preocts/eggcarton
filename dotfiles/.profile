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

# Enter a .venv/ if available
enter_venv () {
    if [ ! -d ".venv/" ] ; then
        echo "No .venv/ detected"
        return 1
    fi
    . .venv/bin/activate
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
    nox --session dev
}

randomize_timezone() {
    tz=$(find /usr/share/zoneinfo/Etc -name 'GMT-*' | shuf -n 1 | grep -o "Etc/.*")
    echo "Setting timezone to random choice: $tz"
    export TZ=$tz
}

alias brag="(cd ~ && python3 ~/braghook.py)"
alias venv=enter_venv
alias python-setup=build_python_project
alias backup="~/.backup_home.sh"
alias backup-clean="~/.backup_home.sh --delete"
alias cp="cp -i"
alias mv="mv -i"
alias neil="cowsay Write down everything that happens in the story, and then in your second draft make it look like you knew what you were doing all along. - Neil Gaiman"
alias randomtz="randomize_timezone"
alias resettz="unset TZ"

# eza alias
alias ls="eza --long --classify --all --group-directories-first --time-style=long-iso --git $@"
alias lg="eza --long --classify --all --group-directories-first --time-style=long-iso --git --git-ignore $@"
alias lt="eza --long --classify --all --group-directories-first --time-style=long-iso --git --tree --time-style=long-iso $@"

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

# neil
neil

