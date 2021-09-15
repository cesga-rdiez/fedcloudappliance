FROM ruby:2.6

#
# Basic stuff
RUN apt-get update \
    && apt-get -qy install --fix-missing curl qemu-utils

RUN gem install cloudkeeper -v 1.7.1
RUN mkdir -p /var/log/cloudkeeper \
             /var/lock/cloudkeeper \
             /var/spool/cloudkeeper/images

COPY entrypoint.sh /entrypoint.sh
COPY image-lists.conf.generated /etc/cloudkeeper/image-lists.conf
COPY cloudkeeper.yml /etc/cloudkeeper/cloudkeeper.yml
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
CMD ["cloudkeeper", "sync"]
