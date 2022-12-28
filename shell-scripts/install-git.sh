#! bin/bash

add-git-core-ppa() {
    echo "Adding git-core PPA..."
    sudo add-apt-repository -y 'ppa:git-core/ppa'
    echo "Done."
}

apt-update-all() {
    echo "Updating packages..."
    sudo apt update
    echo "Done."
}

apt-install() {
    echo "Installing git..."
    sudo apt install git -y
    echo "Done."
}

add-git-core-ppa
apt-update-all
apt-install

git --version

echo "End of line."
