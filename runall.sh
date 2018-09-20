#!/bin/bash
# The vm.max_map_count kernel setting needs to be set to at least 262144 for production use.
sudo sysctl -w vm.max_map_count=262144
# Install Ansible
sudo apt install ansible
# Run Ansible-playbook to download docker and docker-compose. NB! The defaults are already filled in
# in the light of this project
sudo ansible-playbook tasks/main.yml
# Start the ELK stack with docker compose
sudo docker-compose -f dc-elk/docker-compose.yml up 
