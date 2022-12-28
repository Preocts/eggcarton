#! bin/bash

echo "Setting up braghook..."

mkdir ~/brags
curl https://raw.githubusercontent.com/Preocts/braghook/main/src/braghook/braghook.py -o ~/braghook.py

echo "Braghook is now installed. Don't forget to grab your config from the secure notes in 1Password."
echo "End of line."
