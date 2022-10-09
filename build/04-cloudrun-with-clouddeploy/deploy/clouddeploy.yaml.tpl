apiVersion: deploy.cloud.google.com/v1
kind: DeliveryPipeline
metadata:
 name: cloud-run-pipeline
description: application deployment pipeline
serialPipeline:
 stages:
 - targetId: dev-env
   profiles: [dev]
 - targetId: qa-env
   profiles: [qa]
 - targetId: prod-env
   profiles: [prod]
---

apiVersion: deploy.cloud.google.com/v1
kind: Target
metadata:
 name: dev-env
description: Cloud Run development service
run:
 location: projects/_PROJECT_ID/locations/europe-west1
---

apiVersion: deploy.cloud.google.com/v1
kind: Target
metadata:
 name: qa-env
description: Cloud Run QA service
run:
 location: projects/_PROJECT_ID/locations/europe-west1
---

apiVersion: deploy.cloud.google.com/v1
kind: Target
metadata:
 name: prod-env
description: Cloud Run PROD service
run:
 location: projects/_PROJECT_ID/locations/europe-west1
