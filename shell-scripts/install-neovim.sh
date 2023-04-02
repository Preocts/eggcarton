# bin/bash

# Install neovim from source
# https://github.com/neovim/neovim/wiki/Building-Neovim

echo "Install system pre-reqs"
sudo apt-get install ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl

echo "Clone repo and selecting stable branch for build"
git clone https://github.com/neovim/neovim
cd neovim
get checkout stable && make CMAKE_BUILD_TYPE=RelWithDebInfo

echo "Installing Neovim with debug flags to default location /usr/local"
sudo make install

echo "Cleaning up"
cd ..
sudo rm -rf neovim

echo "End of line."

