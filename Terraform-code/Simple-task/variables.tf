
variable "project_id" {
  description = "The ID of the project in which to create the Cloud Run service."
  type        = string
}
variable "region" {
  description = "The region in which to create the Cloud Run service."
  type        = string
  default     = "us-central1"
}

variable "name" {
  description = "The name of the Cloud Run service."
  type        = string
}

variable "location" {
  description = "The location where the Cloud Run service will be created."
  type        = string
  default     = "us-central1"
}

variable "image" {
  description = "The container image to deploy."
  type        = string
}

variable "percent" {
  description = "The percentage of traffic to direct to this revision."
  type        = number
  default     = 100
}

variable "latest_revision" {
  description = "Whether to send traffic to the latest revision."
  type        = bool
  default     = true
}
