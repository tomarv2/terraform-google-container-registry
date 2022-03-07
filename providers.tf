terraform {
  required_version = ">= 1.0.1"
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.12.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "3.1.0"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.2.0"
    }
  }
}
