#! bin/bash
version="go1.19.4.linux-amd64.tar.gz"

wget https://dl.google.com/go/$version
tar -xvf $version
rm $version
mv go $HOME/.local/bin/go

