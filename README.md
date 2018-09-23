# ELK deployment

Deploy an ELK stack Docker Image with some help from Ansible.
## Overview

This project will deploy the following with Ansible

* Docker & Docker-Compose  
* Cluster of 2 Elasticsearch nodes
* 1 Logstash node
* 1 Kibana node

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

```
access to Azure
```

Find the ansible-playbook to set up a VM for you 

### Installing

Clone the repo and run the script inside

```
git clone https://github.com/madzaa/ansible-dc-elk.git
```

```
cd ansible-dc-elk
./runall.sh
```

## Running the tests

Run the following command to see the status of the stack

```
sudo docker-compose -f dc-elk/docker-compose.yml ps
```

If everything is up and running head over to Kibana

```
http://localhost:5601
```

## Configuration

In order to change the configuration of the ELK stack edit :

```
dc-elk/docker-compose.yml
```

For Docker configuration see:
```
tasks/main.yml
```

NB! All of the defaults have been filled in in the light of a test exercise

## Compability

* Ubuntu LTS
* TODO: CentOS
* TODO: Debian
* TODO: Fedora


## Acknowledgments

* Inspiration from deviantonys ELK stack
