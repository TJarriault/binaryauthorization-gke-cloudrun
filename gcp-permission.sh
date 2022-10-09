# Replace PROJECT_ID with the Google Cloud Project ID
PROJECT=""

# Set the project in gcloud
gcloud config set project $PROJECT

# Get the project number
PROJECT_NUMBER=$(gcloud projects list --filter="$PROJECT" --format="value(PROJECT_NUMBER)")

# Add Binary Authorization Attestor Viewer role to Cloud Build Service Account
gcloud projects add-iam-policy-binding $PROJECT \
  --member serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com \
  --role roles/binaryauthorization.attestorsViewer

# Add Cloud KMS CryptoKey Decrypter role to Cloud Build Service Account (PGP-based Signing)
gcloud projects add-iam-policy-binding $PROJECT \
  --member serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com \
  --role roles/cloudkms.cryptoKeyDecrypter

# Add Cloud KMS CryptoKey Signer/Verifier role to Cloud Build Service Account (KMS-based Signing)
gcloud projects add-iam-policy-binding $PROJECT \
  --member serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com \
  --role roles/cloudkms.signerVerifier

# Add Container Analysis Notes Attacher role to Cloud Build Service Account
gcloud projects add-iam-policy-binding $PROJECT \
  --member serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com \
  --role roles/containeranalysis.notes.attacher

# Add Container Analysis Notes Viewer role to Cloud Build Service Account
gcloud projects add-iam-policy-binding $PROJECT \
  --member serviceAccount:${PROJECT_NUMBER}@cloudbuild.gserviceaccount.com \
  --role roles/containeranalysis.notes.viewer
