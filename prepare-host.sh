#!/bin/bash

groupadd -r gitit || echo "Group gitit already exists!"

useradd -c "Gitit wiki" -d /srv/gitit -g gitit -m -r -s /usr/bin/nologin gitit || echo "User gitit already exists!"

for ii in /srv/gitit /etc/gitit ; do
  mkdir -p $ii
  chown -R gitit:gitit $ii
done

