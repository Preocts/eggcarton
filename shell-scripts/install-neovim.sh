# bin/bash

# Install neovim from source
# https://github.com/neovim/neovim/wiki/Building-Neovim

echo "Install system pre-reqs"
sudo apt-get install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl

echo "Clone repo and selecting stable branch for build"
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable

echo "Building with Release compiler flags"
make CMAKE_BUILD_TYPE=Release

echo "Installing Neovim to default location /usr/local"
sudo make install

echo "Cleaning up"
cd ..
rm -rf neovim

echo "End of line."

