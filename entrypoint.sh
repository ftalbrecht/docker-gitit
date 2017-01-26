#!/bin/bash

UID_=${GITIT_UID:-9001}
GID_=${GITIT_GID:-$UID_}

groupmod -g $GID_ gitit
usermod -u $UID_ gitit

chown -R gitit:gitit /srv/gitit
chown -R gitit:gitit /etc/gitit

export LANG=en_US.UTF-8

if [ "X${@}" == "X" ] ; then
  # start gitit if no arguments were given
  if ! [ -e /etc/gitit/gitit.conf ] ; then
    echo "creating default /etc/gitit/gitit.conf ..."
    su -g gitit gitit -s /bin/bash -c "cd && gitit --print-default-config > /etc/gitit/gitit.conf"
  fi
  echo "starting gitit ..."
  su -g gitit gitit -s /bin/bash -c "cd && gitit -f /etc/gitit/gitit.conf"
else
  # execute the given arguments
  ${@}
fi

