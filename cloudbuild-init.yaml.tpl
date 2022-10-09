description: Deploy on push to any branch
github:
  owner: _OWNER_
  name: _REPO_
  push:
    branch: _BRANCH_REGEX_
build:
  steps:
  # Build
  - name: gcr.io/cloud-builders/gcloud
    args:
      - '-c'
      - |
        if [[ "$_DEPLOY_BIN_IMAGE" == "true" ]]
        then
          echo "Deployment binauthz-attestation image"
          git clone https://github.com/GoogleCloudPlatform/cloud-builders-community.git
          cd cloud-builders-community/binauthz-attestation/
          gcloud builds submit . --config cloudbuild.yaml --project=$_PROJECT_ID
        fi
    dir: .
    id: binauthz-attestation
    entrypoint: bash

  # Terraform init
  - id: Terraform init
    name: gcr.io/$PROJECT_ID/terraform:1.2.8
    args:
    - init
    - -backend-config=bucket=${_BUCKET}
    - -backend-config=prefix=${_PREFIX}
    - -migrate-state
    - -input=false
    dir: terraform

  # terraform validate
  - name: gcr.io/$PROJECT_ID/terraform:1.2.8
    args:
    - validate
    dir: terraform

  # terraform plan -input=false -out=tfplan
  - name: gcr.io/$PROJECT_ID/terraform:1.2.8
    args:
    - plan
    - -input=false
    - -var-file=dev.tfvars
    - -out=tf.plan
    dir: terraform

  # terraform apply -auto-approve -input=false tfplan
  - name: gcr.io/$PROJECT_ID/terraform:1.2.8
    args:
    - apply
    - -auto-approve
    - -input=false
    - tf.plan
    dir: terraform

  # Infra Cost
  - id: InfraCost
    #name: gcr.io/$PROJECT_ID/infracost:latest
    name: gcr.io/$PROJECT_ID/terraform:1.2.8
    args:
      - '-c'
      - |
        echo INFRACOST
        apk add curl
        # Downloads the CLI based on your OS/arch and puts it in /usr/local/bin
        curl -fsSL https://raw.githubusercontent.com/infracost/infracost/master/scripts/install.sh | /bin/sh

        export INFRACOST_API_KEY=${_INFRACOST_API_KEY}
        ls -l
        infracost breakdown --path tf.plan
    dir: terraform
    entrypoint: sh

substitutions:
    _BUCKET: _TF_BUCKET_
    _PREFIX: terraform-state/global
    _PROJECT_ID: _PROJECTID_
    _DEPLOY_BIN_IMAGE: "false"
    _INFRACOST_API_KEY: _INFRACOST_KEY_
tags: ['cloud-builders-infra']

timeout: 7200s
options:
  machineType: N1_HIGHCPU_32

