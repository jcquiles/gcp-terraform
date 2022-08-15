variable "bucket_name" {
  type = string
}

variable "kms_key_id" {
  type = string 
}

variable "labels" {
  type    = map(string)
  default = {}
}