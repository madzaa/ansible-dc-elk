# Ansible ELK deployment

Deploy an ELK stack Docker Image using Ansible

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
https://localhost:5601
```

## Deployment

<Add additional notes about how to deploy this on a live system>

## Acknowledgments

* Inspiration from deviantonys ELK stack
