#! bin/bash

nodever="14.x"

# Install node.js and npm apt repository
curl -sL https://deb.nodesource.com/setup_$nodever | sudo bash -
sudo apt update
sudo apt install nodejs

# Install yarn
curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/yarnkey.gpg >/dev/null
echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn

echo "node.js version: $(node --version)"
echo "npm version: $(npm --version)"
echo "yarn version: $(yarn --version)"
