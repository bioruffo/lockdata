#!/bin/bash

set -u -o pipefail

# Initial script by ChatGPT, with modifications

# Check if argument is provided
if [ $# -lt 1 ]
then
  echo "Usage: lockdata directory_or_file [user:group]"
  exit 1
fi

# Initialize tempdir
if [ ! -d "~/.lockdata_script" ]; then
  mkdir -p ~/.lockdata_script
fi

# Set argument as file or directory
target=$1

# Unset "i" attribute recursively
chattr -R -i $target 2> ~/.lockdata_script/chattr.txt
grep -v "chattr: Operation not supported while reading flags on" ~/.lockdata_script/chattr.txt

# Set owner if second argument is present
if [ $# -eq 2 ]
then
  echo "Setting owner to $2 recursively..."
  chown -R $2 $target
fi

echo "Setting 550 and +i on $target..."

# Set permissions to 550 recursively
chmod -R 550 $target

# Set "i" attribute recursively
chattr -R +i $target 2> ~/.lockdata_script/chattr.txt
grep -v "chattr: Operation not supported while reading flags on" ~/.lockdata_script/chattr.txt

echo "Done."
