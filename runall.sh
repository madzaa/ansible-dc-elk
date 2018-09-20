#!/bin/bash
# The vm.max_map_count kernel setting needs to be set to at least 262144 for production use.
sudo sysctl -w vm.max_map_count=262144
# Install Ansible
sudo apt install ansible
# Run Ansible-playbook to download docker and docker-compose. NB! The defaults are already filled in
# in the light of this project
sudo ansible-playbook tasks/main.yml
# Start the ELK stack with docker compose
sudo docker-compose -f dc-elk/docker-compose.yml up -d
# listen up
sudo mkdir logs /tmp/logstash/logfile.log; sudo nc localhost 5041 < /tmp/logstash/logfile.log
# make sum logs
ehco "A bug is never just a mistake. It represents something bigger. An error of thinking. That makes you who you are." > /tmp/logstash/logfile.log
# make it rain
curl -XPOST -D- 'http://localhost:5601/api/saved_objects/index-pattern' \
    -H 'Content-Type: application/json' \
    -H 'kbn-version: 6.4.0' \
    -d '{"attributes":{"title":"logstash-*","timeFieldName":"@timestamp"}}'