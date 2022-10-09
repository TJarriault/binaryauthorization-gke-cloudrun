Setup CloudRUN with GCP services :
- Cloud Deploy
- BinaryAuthorization
- Artifactory
- CloudBuild

# :newspaper:  Setup the Cloud Build pipeline for CloudRUN application
![](./img/clourun-clouddeploy.png)

* What is **Cloud Build**?
With Cloud Build you can build software quickly across all programming languages.

* What is **Cloud Deploy**?
Cloud Deploy is a fully managed continuous delivery service. With Cloud Deploy you can create deployment pipelines for GKE, Anthos and Cloud Run.

* What is **Cloud Run**?
With Cloud Run you can deploy scalable containerized applications written in any language (including Go, Python, Java, Node.js, .NET, and Ruby) on a fully managed platform.

* What is **Skaffold**?
Skaffold is a command-line tool that enables continuous development for Kubernetes-native applications. Cloud Deploy uses Skaffold for render and deploy operations.


## Configuration files

Deploy pipeline file : deploy/clouddeploy.yaml
Skaffold configuration file : config/skaffold.yaml
![](./img/04-config-pipeline-cloudrun.png)


