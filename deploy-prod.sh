#!/bin/sh

set -e

CURRENT_FOLDER=$(pwd)
CURRENT_CONTEXT=$(kubectl config current-context)

kubectl config set current-context do-ams3-openstad

cd k8s/openstad
helm upgrade \
    -n openstad \
    -f custom-values.yaml \
    -f environments/prod.values.yaml \
    openstad .

kubectl config set current-context $CURRENT_CONTEXT
cd $CURRENT_FOLDER