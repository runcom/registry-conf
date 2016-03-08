#!/bin/bash

name=${NAME:-registry-auth-token}

docker run -d -p 5002:5000 --name $name \
	-v `pwd`/config.yml:/etc/docker/registry/config.yml \
	-v `pwd`/server.pem:/cert.pem \
	registry:2.3.0
