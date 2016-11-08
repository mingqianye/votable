# README



* Build and push votable api to docker hub
1. eval $(docker-machine env default)
2. run: ./push_to_dockerhub.sh

* Provision a machine (named sfo) using docker-machine *
1. add ssh key to remote machine root.
2. docker-machine create --driver generic --generic-ip-address=138.68.25.77 --generic-ssh-key ~/.ssh/id_rsa sfo

* Run the votable-api and neo4j in production
1. docker-machine env sfo
2. docker-compose pull
3. docker-compose up -d
