variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "container_image" {
  description = "Docker image of SimpleTimeService"
  type        = string
  default     = "<your-dockerhub-username>/simpletimeservice:latest"
}

# Optional S3 backend variables
variable "backend_bucket" {
  type    = string
  default = ""
}

variable "backend_key" {
  type    = string
  default = ""
}

variable "dynamodb_table" {
  type    = string
  default = ""
}
