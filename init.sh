#!/bin/bash

# Check if superuser, otherwise run sudo and pass HOME path and username.
if [ "$(whoami)" != "root" ]; then
  echo '#  Superuser permission is required.'
  sudo "$0" "$@" -- "$HOME" "$(whoami)"
  exit $?
fi

# use the passed HOME path or use the environment variable if
# not specifies (ie. the script is run as root), same with username
home=${2:-"$HOME"}
user=${3:-"$(whoami)"}
curr=$(dirname $(realpath $0))

# Update .bashrc
echo "# Projects" >> $home/.bashrc
echo "export PROJECTS=$curr" >> $home/.bashrc
echo "source $curr/config" >> $home/.bashrc
echo " $home/.bashrc updated."
source $home/.bashrc

# Create completion file
echo ". $curr/completion" > /etc/bash_completion.d/projects
echo " /etc/bash_completion.d/projects updated."

# Create script to be executed on network up
echo '#!/bin/bash' > /etc/network/if-up.d/projects-update
echo "sudo -HEu $user -s eval '$curr/projects update remote'" >> \
 /etc/network/if-up.d/projects-update
chmod +x /etc/network/if-up.d/projects-update
echo " /etc/network/if-up.d/projects-update created."

source $home/.bashrc
echo "Done."
