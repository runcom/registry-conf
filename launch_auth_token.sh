#!/bin/bash

name=${NAME:-registry-auth-token}

docker run -d -p 5003:5000 --restart=always --name $name \
	-v `pwd`/auth:/auth \
	-e REGISTRY_AUTH=token \
	-e "REGISTRY_AUTH_TOKEN_REALM=https://auth.docker.io/token" \
	-e REGISTRY_AUTH_TOKEN_ISSUER=docker \
	-e REGISTRY_AUTH_TOKEN_ROOTCERTBUNDLER=certs/ \
	-e REGISTRY_AUTH_TOKEN_SERVICE="registry.docker.io" \
	-v `pwd`/certs:/certs \
	-e REGISTRY_HTTP_TLS_CERTIFICATE=certs/domain.crt \
	-e REGISTRY_HTTP_TLS_KEY=certs/domain.key \
	registry:2.3.0
