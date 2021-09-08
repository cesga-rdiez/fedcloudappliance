#!/bin/bash

IMAGENAME=fedcloud-os-cloudkeeper-os

docker build --network=host -t ${IMAGENAME}:$(date -I) -t ${IMAGENAME}:latest .

