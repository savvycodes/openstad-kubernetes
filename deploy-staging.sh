#!/bin/sh

set -e

CURRENT_FOLDER=$(pwd)
CURRENT_CONTEXT=$(kubectl config current-context)

kubectl config set current-context do-ams3-openstad-staging

cd k8s/openstad
# helm repo update
helm upgrade \
    -n openstad \
    -f custom-values.staging.yaml \
    -f environments/stage.values.yaml \
    openstad .

kubectl config set current-context $CURRENT_CONTEXT
cd $CURRENT_FOLDER
