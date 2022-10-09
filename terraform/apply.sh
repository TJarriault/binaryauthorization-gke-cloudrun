#!/bin/sh

DEPLOY_BUCKET="terraform-binaryauthorization"
terraform apply -var-file=dev.tfvars
