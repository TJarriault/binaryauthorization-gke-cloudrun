Ref : 
https://codelabs.developers.google.com/cloud-run-app-deployment-with-cloud-deploy?hl=en#2
https://codelabs.developers.google.com/codelabs/cloud-run-deploy#3

Manual deployment
gcloud deploy releases create helloworld-app-9fa592b6496e --region=europe-west1 --delivery-pipeline=cloud-run-pipeline --images=gke-container=gcr.io/<PROJECT_ID>/helloworld-app@sha256:XXXXX --skaffold-file=skaffold.yaml
