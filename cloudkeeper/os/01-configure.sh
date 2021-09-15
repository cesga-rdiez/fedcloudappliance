#!/bin/bash

source 00-configuration.conf

envsubst < cloudkeeper-os.conf.template > cloudkeeper-os.conf.generated

# Count number of projects:
nvo=0
for i in ${VO_NAMES}; do nvo=$((nvo+1)); done

echo '{' > mapping.json.generated
n=0
for i in ${VO_NAMES}
  do
    n=$((n+1))
    printf "\t\"%s\": {\n\t\t\"tenant\": \"%s\"\n\t}" $i $i >>mapping.json.generated
    if [[ $n -ne $nvo ]]; then echo -n "," >>mapping.json.generated; fi
    echo  >>mapping.json.generated
  done

echo '}' >> mapping.json.generated

