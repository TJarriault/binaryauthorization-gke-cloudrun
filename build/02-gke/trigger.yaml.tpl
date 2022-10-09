---
description: Application deployment with Binary authorization for GKE
disabled: false
filename: build/01-cloudrun/cloudbuild.yaml
name: CloudRUN-deploy-application-image-1
substitutions:
  _COMPUTE_REGION: LOCATION
  _IMAGE_NAME: BUILD_IMAGE
  _PROJECT: PROJECT_ID
  _REGION: LOCATION

triggerTemplate:
  branchName: BRANCH_REGEX
  projectId: PROJECT_ID
  repoName: REPO
