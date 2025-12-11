variable "GOOGLE_PROJECT" {
  description = "ID GCP проєкту"
  type        = string
}

variable "GOOGLE_REGION" {
  description = "Регіон GCP для GKE (наприклад, us-central1)"
  type        = string
  default     = "us-central1"
}

variable "GKE_NUM_NODES" {
  description = "Кількість нод у GKE кластері"
  type        = number
  default     = 2
}
