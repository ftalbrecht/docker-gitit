#!/bin/bash

# following https://wiki.archlinux.org/index.php/ArchHaskell#Available_repositories
# * keys
#   - haskell-core
pacman-key -r 4209170B
pacman-key --lsign-key 4209170B
#   - haskell-hapstack
pacman-key -r B0544167
pacman-key --lsign-key B0544167
# * repos
#   - core before community
sed -i 's;\[community\];[haskell-core]\nServer = http://xsounds.org/~haskell/core/$arch\n\n[community];' /etc/pacman.conf
#   - hapstack last
echo "" >> /etc/pacman.conf
echo "[haskell-happstack]" >> /etc/pacman.conf
echo "Server = http://noaxiom.org/\$repo/\$arch" >> /etc/pacman.conf
# refresh
pacman -Sy

