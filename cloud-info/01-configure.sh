#!/bin/bash

source 00-configuration.conf

envsubst < openstack.rc.template > openstack.rc.generated


echo "site:" >openstack.yaml.generated
printf "\tname: %s\n\n" $SITENAME >>openstack.yaml.generated
echo "compute:" >>openstack.yaml.generated
echo "    # Configure here the VOs supported at your installation" >>openstack.yaml.generated
echo "    shares:" >>openstack.yaml.generated
echo "        # Name of the VO" >>openstack.yaml.generated

for i in ${PROJECTS}
  do
    PROJECT_NAME=$(echo $i |cut -d',' -f1)
    PROJECT_ID=$(echo $i |cut -d',' -f2)
    printf "        %s:\n" $PROJECT_NAME >>openstack.yaml.generated
    echo "            auth:" >>openstack.yaml.generated
    echo "                # the project id in OpenStack" >>openstack.yaml.generated
    printf "                project_id: %s\n" $PROJECT_ID >>openstack.yaml.generated
    echo "            # Default network type: none, public, public_only, private, private_only" >>openstack.yaml.generated
    echo "            default_network_type: public" >>openstack.yaml.generated
    echo "            # Public Network name" >>openstack.yaml.generated
    echo "            public_network_name: PUBLIC" >>openstack.yaml.generated
    echo >>openstack.yaml.generated
  done

echo "    # Total number of cores available" >>openstack.yaml.generated
echo "    total_cores: 0" >>openstack.yaml.generated
echo "    # Total RAM available (GB)" >>openstack.yaml.generated
echo "    total_ram: 0" >>openstack.yaml.generated
echo "    # Hypervisor name" >>openstack.yaml.generated
echo "    hypervisor: Foo Hypervisor" >>openstack.yaml.generated
echo "    # Hypervisor version" >>openstack.yaml.generated
echo "    hypervisor_version: 0.0.0" >>openstack.yaml.generated

