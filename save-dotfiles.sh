#! bin/bash

# Save the common dot files to ./dotfiles, add as needed

mkdir -p dotfiles/.config/nvim

cp ~/.profile ./dotfiles
cp ~/.gitconfig ./dotfiles
cp ~/.python_repl.py ./dotfiles
cp ~/.vimrc ./dotfiles
cp ~/.rsync_ignore ./dotfiles
cp ~/.backup_home.sh ./dotfiles
cp -r ~/.config/nvim/after ./dotfiles/.config/nvim/after
cp -r ~/.config/nvim/lua ./dotfiles/.config/nvim/lua
cp  ~/.config/nvim/init.lua ./dotfiles/.config/nvim/init.lua

