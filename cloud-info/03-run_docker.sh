#!/bin/bash
#

DOCKNAME="fedcloud-os-cloudinfo"

if [ -z $1 ]; then
        IMAGE="${DOCKNAME}"
else
        IMAGE="${DOCKNAME}:$1"
fi

## Use network host in order to use same IP that host and about certificate based authentication issues.
docker run -d --restart=always -v /etc/grid-security:/etc/grid-security --network=host --hostname $DOCKNAME --name $DOCKNAME $IMAGE

