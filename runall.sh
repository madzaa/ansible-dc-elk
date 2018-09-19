#!/bin/bash

sudo apt install ansible

sudo ansible-playbook tasks/main.yml

sudo docker-compose -f dc-elk/docker-compose.yml up 
