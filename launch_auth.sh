#!/bin/bash

name=${NAME:-registry-auth}

docker run -d -p 5001:5000 --name $name \
	-v `pwd`/auth:/auth \
	-e "REGISTRY_AUTH=htpasswd" \
	-e "REGISTRY_AUTH_HTPASSWD_REALM=Registry Realm" \
	-e REGISTRY_AUTH_HTPASSWD_PATH=auth/htpasswd \
	-v `pwd`/certs:/certs \
	-e REGISTRY_HTTP_TLS_CERTIFICATE=certs/domain.crt \
	-e REGISTRY_HTTP_TLS_KEY=certs/domain.key \
	registry:2.3.0
