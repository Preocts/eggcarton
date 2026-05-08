#! bin/bash

git clone https://github.com/pyenv/pyenv.git ~/.pyenv

restoredir=$(pwd)
cd ~/.pyenv && src/configure && make -C src
cd $restoredir

