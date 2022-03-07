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
  description = "Feature flag, true or false"
  default     = true
  type        = bool
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

variable "dockerfile_folder" {
  type        = string
  description = "This is the folder which contains the Dockerfile"
}
