#!/bin/bash

IMAGENAME=fedcloud-os-cloudkeeper-core

docker build --network=host -t ${IMAGENAME}:$(date -I) -t ${IMAGENAME}:latest .

