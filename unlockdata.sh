#!/bin/bash

# Set permissions 770 and attribute -i (mutable) for a file or a folder (recursively).
# Optionally, set the user and group (also recursively if on a folder).

set -eu -o pipefail

# The script must be used with at least one argument (the file or directory to be locked)
if [ $# -lt 1 ]
then
  echo "Usage: unlockdata directory_or_file [user:group]"
  exit 1
fi

# First argument is the file or directory
target=$1

# Unset "i" attribute recursively
chattr -R -i $target

# Set owner:group if second argument is present
if [ $# -eq 2 ]
then
  echo "Setting owner to $2 recursively..."
  chown -R $2 $target
fi

# Set permissions to 770
echo "Setting 770 on $target..."
chmod -R 770 $target

echo "Done. BE RESPONSIBLE!"
