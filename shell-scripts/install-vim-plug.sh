#! bin/bash
echo "Setting up vim..."

# Download plug and place in .vim directory
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Ensure our vimrc is in place
cp ~/eggcarton/dotfiles/.vimrc ~

# Run plug install from cli
vim -es -u ~/.vimrc -i NONE -c "PlugInstall" -c "qa"

echo "End of line."
