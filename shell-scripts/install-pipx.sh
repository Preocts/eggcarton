#! bin/bash

sudo apt install python3-pip

gpip install pipx --break-system-packages

pipx install pre-commit
pipx install nox
pipx install git+https://github.com/Preocts/daystats

