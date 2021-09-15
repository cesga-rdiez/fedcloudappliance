FORKED FROM https://github.com/enolfc/fedcloudappliance

# fedcloudappliance
EGI Federated Cloud Appliance

This is a set of docker containers to federate a OpenStack deployment into EGI
Federated Cloud. They are all packaged on a single VM that runs the services
and connects to the OpenStack using configured credentials.

These are the configured components:
* Information Discovery (BDII)
* Accounting (cASO + SSMsend)
* VMI replication (cloudkeeper)

Documentation is available at https://docs.egi.eu/providers/cloud-compute/openstack/


## Notes

 * In the host, /etc/hosts must include controler resolv info. For example:

     10.0.0.1   keystone
     10.0.0.1   nova
     10.0.0.1   glance
     10.0.0.1   neutron
     10.0.0.1   cinder

   Or, for all-in-one aproach:

     10.0.0.1 contrller

 * The network type for the container is __network__, so the file /etc/hosts
   from the host is shared with the container.

 * Be careful with the firewall rules in the host. These ports should be open:

   5000 (keystone)
   8774 (nova)
   9292 (glance)
   9696 (neutron)
   8776 (cinder)

 * Install EGI CAs

   # cd /etc/yum.repos.d/
   # wget https://repository.egi.eu/sw/production/cas/1/current/repo-files/EGI-trustanchors.repo
   # wget https://repository.egi.eu/sw/production/cas/1/current/repo-files/egi-trustanchors.repo
   # wget https://repository.egi.eu/sw/production/cas/1/current/repo-files/lcg-trustanchors.repo
   # yum install ca-policy-egi-core ca-policy-egi-cam ca-policy-lcg

 * Copy certicate and key to /etc/grid-security/ . The file names MUST be
   hostcert.pem and hostkey.pem

   # copy mycert.pem /etc/grid-security/hostcert.pem
   # copy mykey.pem /etc/grid-security/hostkey.pem
   # chmod 400 /etc/grid-security/hostkey.pem

## Running the proxy:

 * Editing "00-configuration.conf" file.

 * Configure running the script "./01-configure.sh"

 * Build the image by running the script "./02-build.sh".

 * Run the docker by running the script "./03-run_docker.sh".

