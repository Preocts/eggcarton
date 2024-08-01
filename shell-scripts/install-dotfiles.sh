#! bin/bash

echo "Setting up dotfiles..."

cp -r ~/eggcarton/dotfiles/. ~
cp ~/eggcarton/.profile.env.sample ~/.profile.env

echo "End of line."
