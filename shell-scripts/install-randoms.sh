#! bin/bash

while read line; do apt install -y $line; done < randoms.txt

