#!/bin/sh

set -e

mkdir -p ~/.kube/
echo ${KUBECTL_CONFIG} | base64 -d > ~/.kube/config

exec "$@"
