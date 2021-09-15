#!/bin/bash

source 00-configuration.conf

envsubst < caso.conf.template > caso.conf.generated

IFS=',';

# Count number of projects:
nproj=0
for i in ${PROJECTS}; do nproj=$((nproj+1)); done

echo '{' > voms.json.generated
n=0
for i in ${PROJECTS}
  do
    n=$((n+1))
    printf "\t\"%s\": {\n\t\t\"projects\": [\"%s\"]\n\t}" $i $i >>voms.json.generated
    if [[ $n -ne $nproj ]]; then echo -n "," >>voms.json.generated; fi
    echo  >>voms.json.generated
  done

echo '}' >> voms.json.generated

