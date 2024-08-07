#! bin/bash

add-deadsnakes-ppa() {
    echo "Adding deadsnakes PPA..."
    sudo add-apt-repository -y 'ppa:deadsnakes/ppa'
    echo "Done."
}

apt-update-all() {
    echo "Updating packages..."
    sudo apt update
    echo "Done."
}

apt-install() {
    echo "Installing Python..."
    sudo apt install -y python3.9 python3.10 python3.11 python3.12 python3.13
    sudo apt install -y python3.9-venv python3.10-venv python3.11-venv python3.12-venv python3.13-venv
    echo "Done."
}

add-deadsnakes-ppa
apt-update-all
apt-install

echo "End of line."

