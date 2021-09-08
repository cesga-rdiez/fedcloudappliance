FROM python:3

ARG CLOUD_INFO_VERSION=argo-ams-library

# hadolint ignore=DL3013
RUN pip install --no-cache-dir \
        "git+https://github.com/enolfc/cloud-info-provider.git@$CLOUD_INFO_VERSION" \
        python-glanceclient python-novaclient python-keystoneclient keystoneauth1 yq

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

COPY cloud-info-provider /usr/local/bin/cloud-info-provider
COPY openstack.rc /etc/cloud-info-provider/openstack.rc
COPY openstack.yaml /etc/cloud-info-provider/openstack.yaml
RUN chmod +x /usr/local/bin/cloud-info-provider

CMD ["/usr/local/bin/cloud-info-provider"]
