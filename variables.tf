variable "teamid" {
  description = "(Required) Name of the team/group e.g. devops, dataengineering. Should not be changed after running 'tf apply'"
}

variable "prjid" {
  description = "(Required) Name of the project/stack e.g: mystack, nifieks, demoaci. Should not be changed after running 'tf apply'"
}

variable "gcp_project" {
  description = "Name of the GCP project"
}

variable "gcr_location" {
  type        = string
  description = "The location of the registry. One of ASIA, EU, US or not specified. See the official documentation for more information on registry locations."

  validation {
    condition     = can(regex("^(ASIA|EU|US)$", var.gcr_location))
    error_message = "Possible values are: ASIA, EU or US."
  }
  default = "US"
}

variable "deploy_registry" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "add_registry_members" {
  description = "feature flag, true or false"
  default     = true
  type        = bool
}

variable "gcp_token" {
  description = "GCP Authentication token."
  type        = string
  default     = ""
}

variable "name" {
  description = "Name of the image."
  type        = string
}

variable "tag" {
  description = "Image tag."
  type        = string
  default     = "latest"
}

#
variable "dockerfile_folder" {
  type        = string
  description = "This is the folder which contains the Dockerfile"
}

variable "gcp_region" {
  default = "us-central1"
}