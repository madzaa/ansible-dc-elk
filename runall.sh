#!/bin/bash

sudo apt install ansible

sudo ansible-playbook tasks/main.yml

sudo jdocker-compose up dc-elk/docker-compose.yml
