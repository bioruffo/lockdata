#!/bin/bash

# Set permissions 550 and attribute +i (immutable) for a file or a folder (recursively).
# Optionally, set the user and group (also recursively if on a folder).

set -eu -o pipefail

# The script must be used with at least one argument (the file or directory to be locked)
if [ $# -lt 1 ]
then
  echo "Usage: lockdata directory_or_file [user:group]"
  exit 1
fi

# First argument is the file or directory
target=$1

# Temporarily unset "i" attribute recursively
chattr -R -i $target

# Second argument is owner:group
if [ $# -eq 2 ]
then
  echo "Setting owner to $2 recursively..."
  chown -R $2 $target
fi

echo "Setting 550 and +i on $target..."
chmod -R 550 $target
chattr -R +i $target

echo "Done."
