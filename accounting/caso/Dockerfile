FROM python:3.8

# CMD packages for 1.4.3 are missing, so going for pip instead
# Using version 2.1.1
ARG CASO_VERSION=2.1.1

RUN pip install git+https://github.com/IFCA/caso.git@$CASO_VERSION

RUN mkdir -p /var/spool/caso
COPY caso.conf /etc/caso/caso.conf
COPY voms.json /etc/caso/voms.json

CMD ["/usr/local/bin/caso-extract"]
