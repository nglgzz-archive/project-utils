#!/bin/bash

# Use the passed HOME path or use the environment variable if
# not specifies (ie. the script is run as root), same with username
home=${2:-"$HOME"}
curr=$(dirname $(realpath $0))

# Update .zshrc
echo "# Projects" >> $home/.zshrc
echo "export PROJECTS=$curr" >> $home/.zshrc
echo 'source $PROJECTS/config' >> $home/.zshrc
echo " $home/.zshrc updated."
source $home/.zshrc

echo "Done."
