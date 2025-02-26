#! bin/bash
version="go1.23.4.linux-amd64.tar.gz"

wget https://dl.google.com/go/$version
tar -xvf $version
rm $version
mkdir -p $HOME/.local/bin/go
mv -f go $HOME/.local/bin/

