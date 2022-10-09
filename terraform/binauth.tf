#======================
# Creating signing keys
#======================
data "google_kms_crypto_key_version" "version" {
  crypto_key = google_kms_crypto_key.crypto-key.id
}


resource "google_kms_key_ring" "keyring" {
  #name     = "attestor-key-ring"
  name     = "kms-binauthz-keys"
  location = "global"
}

resource "google_kms_crypto_key" "crypto-key" {
  #name     = "attestor-key"
  name     = "sign-codedeploy-key"
  key_ring = google_kms_key_ring.keyring.id
  purpose  = "ASYMMETRIC_SIGN"

  version_template {
    #algorithm = "RSA_SIGN_PKCS1_4096_SHA512"
    algorithm = "ec-sign-p256-sha256"
  }

  lifecycle {
    prevent_destroy = false
  }
}

#=================================
# Binary authorization
#=================================

resource "google_container_analysis_note" "note" {
  name = "vulnz-note2"

  short_description = "image passed vulnerability policy"
  long_description  = <<EOF
attached to an image which passed the vulnerability
scan without violating the security policy.
EOF

  attestation_authority {
    hint {
      human_readable_name = "vulnerability policy attestors"
    }
  }
}
resource "google_binary_authorization_attestor" "attestor" {
  name = "vulnz-attestator"
  attestation_authority_note {
    note_reference = google_container_analysis_note.note.name
    public_keys {
      id = data.google_kms_crypto_key_version.version.id
      pkix_public_key {
        public_key_pem      = data.google_kms_crypto_key_version.version.public_key[0].pem
        signature_algorithm = data.google_kms_crypto_key_version.version.public_key[0].algorithm
      }
    }
  }
}


resource "google_binary_authorization_policy" "policy" {
  admission_whitelist_patterns {
    name_pattern = "gcr.io/google_containers/*"
  }

  default_admission_rule {
    evaluation_mode  = "ALWAYS_ALLOW"
    enforcement_mode = "ENFORCED_BLOCK_AND_AUDIT_LOG"
  }

  cluster_admission_rules {
    cluster                 = format("%s.%s-%s", var.region, var.project, var.cluster_name_prod)
    evaluation_mode         = "REQUIRE_ATTESTATION"
    enforcement_mode        = "ENFORCED_BLOCK_AND_AUDIT_LOG"
    require_attestations_by = ["${google_binary_authorization_attestor.attestor.name}"]
  }
}

