#!/bin/bash

source 00-configuration.conf

echo "# One image list per line" >image-lists.conf.generated
echo "# Lines can be commented if started with \"\#\"" >>image-lists.conf.generated

for i in ${VO_NAMES}
  do
    printf "https://%s:x-oauth-basic@vmcaster.appdb.egi.eu/store/vo/%s/image.list\n" $PPDB_TOKEN $i >>image-lists.conf.generated
  done

