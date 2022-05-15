#! bin/bash
package="exercism-3.0.13-linux-x86_64.tar.gz"

get-package() {
    echo "Downloading 3.0.13..."
    wget https://github.com/exercism/cli/releases/download/v3.0.13/$package
}

install-package() {
    echo "Installing package..."
    tar -xf $package exercism
    mkdir -p ~/bin
    mv exercism ~/bin
}

cleanup-install() {
    echo "Cleaning up..."
    rm -f $package
}

get-package
install-package
cleanup-install

echo "Remember to setup exercism configuration:"
echo "https://exercism.org/settings/api_cli"
echo "exercism configure --token=[YOUR TOKEN]"
