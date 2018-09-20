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
# ZZZ
echo "Setting up ELK environment"
echo "##########################"
sleep 25s
# Make stuff
sudo mkdir -p /home/${USER}/logstash/; sudo touch /home/${USER}/logstash/logfile.log
# Ere me now
sudo nc localhost 5041 < /home/${USER}/logstash/logfile.log
# make sum logs
sudo bash -c " echo A bug is never just a mistake. It represents something bigger. A \
n error of thinking. That makes you who you are. > /home/${USER}/logstash/logfile.log"
# make it rain
curl -XPOST -D- 'http://localhost:5601/api/saved_objects/index-pattern' \
    -H 'Content-Type: application/json' \
    -H 'kbn-version: 6.4.0' \
    -d '{"attributes":{"title":"logstash-*","timeFieldName":"@timestamp"}}'
\n
echo "Magic inbound in 25s"
sleep 15s
echo "Open up https://localhost:5601 to see the magic"