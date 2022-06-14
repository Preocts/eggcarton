#! bin/bash

add-git-core-ppa() {
    echo "Adding git-core PPA..."
    add-apt-repository -y 'ppa:git-core/ppa'
    echo "Done."
}

apt-update-all() {
    echo "Updating packages..."
    apt update
    echo "Done."
}

apt-install() {
    echo "Installing git..."
    apt install git -y
    echo "Done."
}

add-git-core-ppa
apt-update-all
apt-install

git --version

echo "End of line."
