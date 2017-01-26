#!/bin/bash

docker run --hostname $HOSTNAME --publish 5001:5001 --volume /etc/gitit:/etc/gitit --volume /srv/gitit:/srv/gitit  -t -i -e GITIT_UID=$(getent passwd gitit | cut -d ':' -f 3) -e GITIT_GID=$(getent group gitit | cut -d ':' -f 3) gitit:latest

