#!/bin/bash
# The vm.max_map_count kernel setting needs to be set to at least 262144 for production use.
sudo sysctl -w vm.max_map_count=262144
# Install Ansible
sudo apt-get -y update
sudo apt-get -y install software-properties-common
sudo apt-add-repository -y ppa:ansible/ansible
sudo apt-get -y update && sudo apt-get -y upgrade
sudo apt-get -y install ansible
# Run Ansible-playbook to download docker and docker-compose. NB! The defaults are already filled in
# in the light of this project
sudo ansible-playbook tasks/main.yml
# ZZZ
echo "Setting up ELK environment"
echo "##########################"
sleep 25s
# Make stuff
mkdir -p /home/${USER}/logstash/; touch /home/${USER}/logstash/logfile.log
# Kibana pattern
curl -XPOST -D- 'http://localhost:5601/api/saved_objects/index-pattern' \
    -H 'Content-Type: application/json' \
    -H 'kbn-version: 6.4.0' \
    -d '{"attributes":{"title":"logstash-*","timeFieldName":"@timestamp"}}'

# Test script for ES/LS
sudo bash -c " echo A bug is never just a mistake. It represents something bigger. An error of thinking. That makes you who you are. > /home/${USER}/logstash/logfile.log"
#
sleep 10s
# ES/LS
nc localhost 5041 < /home/${USER}/logstash/logfile.log
#
echo "Magic happens here - https://localhost:5601"
