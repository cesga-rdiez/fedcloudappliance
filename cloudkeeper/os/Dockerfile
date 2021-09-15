FROM centos:7

## Train seems to be latest OpenStack version supported by CentOS7.
## Hope it works for Wallaby
RUN yum install -y centos-release-openstack-train
# moved to different location as repos are not fully functional
## Is cloudkeeper ported to centos8??
RUN curl http://appdb.egi.eu:9009/api/repofiles/index.php?id=1141 > /etc/yum.repos.d/cloudkeeper.repo
RUN yum install -y cloudkeeper-os

RUN mkdir -p /etc/cloudkeeper-os/ \
             /var/spool/cloudkeeper/images

COPY cloudkeeper-os.conf.generated /etc/cloudkeeper-os/cloudkeeper-os.conf
COPY mapping.json.generated /etc/cloudkeeper-os/mapping.json

# Patch the cloudkeeper-os
COPY openstack_client.py /usr/lib/python2.7/site-packages/cloudkeeper_os/openstack_client.py
RUN python -m compileall  /usr/lib/python2.7/site-packages/cloudkeeper_os/openstack_client.py

## Will be run with network=host
#EXPOSE 50051

CMD ["cloudkeeper-os"]
