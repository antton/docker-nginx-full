#!/bin/bash -e

BLUE='\E[1;34m'
CYAN='\E[1;36m'
YELLOW='\E[1;33m'
GREEN='\E[1;32m'
RESET='\E[0m'

REGISTRY=${REGISTRY:-}
DOCKER_IMAGE="${REGISTRY}nginxproxymanager/nginx-full"

export OPENRESTY_VERSION=1.27.1.1
export CROWDSEC_OPENRESTY_BOUNCER_VERSION=0.1.7
export LUA_VERSION=5.1.5
export LUAROCKS_VERSION=3.3.1

export BASE_IMAGE="${DOCKER_IMAGE}:latest"
export ACMESH_IMAGE="${DOCKER_IMAGE}:acmesh"
export CERTBOT_IMAGE="${DOCKER_IMAGE}:certbot"
export CERTBOT_NODE_IMAGE="${DOCKER_IMAGE}:certbot-node"
export ACMESH_GOLANG_IMAGE="${DOCKER_IMAGE}:acmesh-golang"

# Builds

echo -e "${BLUE}❯ ${CYAN}Building ${YELLOW}latest ${CYAN}...${RESET}"
docker build \
	--pull \
	--build-arg OPENRESTY_VERSION \
	--build-arg CROWDSEC_OPENRESTY_BOUNCER_VERSION \
	--build-arg LUA_VERSION \
	--build-arg LUAROCKS_VERSION \
	-t "$BASE_IMAGE" \
	-f docker/Dockerfile \
	.
