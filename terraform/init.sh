#!/bin/sh

DEPLOY_BUCKET="terraform-binaryauthorization"
echo $DEPLOY_BUCKET
terraform init -backend-config=bucket=$DEPLOY_BUCKET -backend-config=prefix=terraform-state/global -input=false;
