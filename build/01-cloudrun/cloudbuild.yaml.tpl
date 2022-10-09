steps:
  # Build 
  - name: gcr.io/cloud-builders/docker
    args:
      - '-c'
      - |
        echo "Development exec only"
        docker build -f Dockerfile . -t gcr.io/$_PROJECT/$_IMAGE_NAME:$SHORT_SHA  --build-arg PROJECT_ID=$_PROJECT
    dir: .
    id: tjabin
    entrypoint: bash

  # Pushing to artifact registry
  - id: Push the containerized application
    name: "gcr.io/cloud-builders/docker"
    args:
      [
        "push",
        "gcr.io/$_PROJECT/$_IMAGE_NAME:${SHORT_SHA}"
      ]


  # Run a vulnerability scan at _SECURITY level
  - id: Vulnerability scan
    name: "gcr.io/cloud-builders/gcloud"
    entrypoint: "bash"
    args:
      - "-c"
      - |
        gcloud artifacts docker images scan \
        "gcr.io/$_PROJECT/$_IMAGE_NAME:${SHORT_SHA}" \
        --remote \
        --format="value(response.scan)" > /workspace/scan_id.txt

  # Analyze the result of the scan
  - id: Check vulnerabilities severity
    name: "gcr.io/cloud-builders/gcloud"
    entrypoint: "bash"
    args:
      - "-c"
      - |
        gcloud artifacts docker images list-vulnerabilities $(cat /workspace/scan_id.txt) \
        --format="value(vulnerability.effectiveSeverity)" | if grep -Fxq ${_SEVERITY}; \
        then echo "Failed vulnerability check for ${_SEVERITY} level" && exit 1; else echo "No ${_SEVERITY} vulnerability found, congrats !" && exit 0; fi

  # Create attestation to deploy only images built by Cloud Build
  - id: Create attestation
    name: "gcr.io/${PROJECT_ID}/binauthz-attestation:latest"
    args:
      - "--artifact-url"
      - "gcr.io/$_PROJECT/$_IMAGE_NAME:${SHORT_SHA}"
      - "--attestor"
      - "projects/${PROJECT_ID}/attestors/${_ATTESTOR_NAME}"
      - "--keyversion"
      - "projects/${PROJECT_ID}/locations/${_KMS_LOCATION}/keyRings/${_KMS_KEYRING}/cryptoKeys/${_KMS_KEY}/cryptoKeyVersions/${_KMS_KEY_VERSION}"

  # Push to Cloud Run
  - id: Push to Cloud Run
    name: "gcr.io/cloud-builders/gcloud"
    args:
      [
        "run",
        "deploy",
        "${_IMAGE_NAME}",
        "--image",
        "gcr.io/$_PROJECT/$_IMAGE_NAME:${SHORT_SHA}",
        "--region",
        "${_COMPUTE_REGION}",
        "--port",
        "80",
        "--platform",
        "managed"
      ]

substitutions:
    _IMAGE_NAME: BUILD_IMAGE
    _PROJECT: PROJECT_ID
