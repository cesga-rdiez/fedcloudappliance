#!/bin/sh

docker run -v /etc/grid-security:/etc/grid-security \
           -v /var/spool/apel:/var/spool/apel \
           --rm egifedcloud/ssm ssmsend
