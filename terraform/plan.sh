#!/bin/sh

DEPLOY_BUCKET="terraform-binaryauthorization"
terraform plan -var-file=dev.tfvars
