#!/bin/bash

IMAGENAME=fedcloud-os-caso

docker build --network=host -t ${IMAGENAME}:$(date -I) -t ${IMAGENAME}:latest .

