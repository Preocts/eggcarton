#! bin/bash

if ! command -v cargo 2>&1 >/dev/null
then
    echo "cargo not installed, run install-rustup.sh first."
    exit 1
fi

cargo install eza

which eza
eza --version

