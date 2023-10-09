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

dpkg-install-delta() {
    echo "Install delta for git..."
    curl --silent --show-error --location https://github.com/dandavison/delta/releases/download/0.16.5/git-delta-musl_0.16.5_amd64.deb -o delta.deb
    sudo dpkg --install delta.deb
    rm delta.deb
    echo "Done."
}

add-git-core-ppa
apt-update-all
apt-install
dpkg-install-delta

git --version
delta --version

echo "End of line."
