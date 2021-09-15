#!/bin/bash

IMAGENAME=fedcloud-os-cloudinfo

docker build --network=host -t ${IMAGENAME}:$(date -I) -t ${IMAGENAME}:latest .

