
# ================================
# Add permission to cloudbuild SA
# ================================

resource "google_project_iam_member" "attestorsViewer" {
  project = var.project
  role    = "roles/binaryauthorization.attestorsViewer"
  member  = "serviceAccount:${local.PROJECT_NUMBER}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "cryptoKeyDecrypter" {
  project = var.project
  role    = "roles/cloudkms.cryptoKeyDecrypter"
  member  = "serviceAccount:${local.PROJECT_NUMBER}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "signerVerifier" {
  project = var.project
  role    = "roles/cloudkms.signerVerifier"
  member  = "serviceAccount:${local.PROJECT_NUMBER}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "notes_attacher" {
  project = var.project
  role    = "roles/containeranalysis.notes.attacher"
  member  = "serviceAccount:${local.PROJECT_NUMBER}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "notes_viewer" {
  project = var.project
  role    = "roles/containeranalysis.notes.viewer"
  member  = "serviceAccount:${local.PROJECT_NUMBER}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "operator" {
  project = var.project
  role    = "roles/clouddeploy.operator"
  member  = "serviceAccount:${local.PROJECT_NUMBER}@cloudbuild.gserviceaccount.com"
}

resource "google_project_iam_member" "servicea" {
  project = var.project
  role    = "roles/iam.serviceAccountUser"
  member  = "serviceAccount:${local.PROJECT_NUMBER}@cloudbuild.gserviceaccount.com"
}
