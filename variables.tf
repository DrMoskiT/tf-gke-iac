variable "GOOGLE_PROJECT" {
  description = "ID GCP проекту"
  type        = string
}

variable "GOOGLE_REGION" {
  description = "Регіон GCP для GKE (наприклад, us-central1)"
  type        = string
  default     = "us-central1"
}

variable "GKE_NUM_NODES" {
  description = "Кількість нод у node pool"
  type        = number
  default     = 2
}
