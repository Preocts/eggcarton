#! bin/bash

add-deadsnakes-ppa() {
    echo "Adding deadsnakes PPA..."
    add-apt-repository -y 'ppa:deadsnakes/ppa'
    echo "Done."
}

apt-update-all() {
    echo "Updating packages..."
    apt update
    echo "Done."
}

apt-install() {
    echo "Installing Python..."
    apt install -y python3.8 python3.9 python3.10
    apt install -y python3.8-venv python3.9-venv python3.10-venv
    echo "Done."
}

add-deadsnakes-ppa
apt-update-all
apt-install

echo "End of line."
