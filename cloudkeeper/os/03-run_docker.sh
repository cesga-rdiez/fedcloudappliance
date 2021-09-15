#!/bin/bash
#

DOCKNAME="fedcloud-os-cloudkeeper-os"

if [ -z $1 ]; then
        IMAGE="${DOCKNAME}"
else
        IMAGE="${DOCKNAME}:$1"
fi

## Use network host in order to use same IP that host and about certificate based authentication issues.
docker run -d --restart=always --network=host --hostname $DOCKNAME --name $DOCKNAME $IMAGE

