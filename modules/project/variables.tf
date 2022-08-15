variable "project_id" {
  type = string
}

variable "project_name" {
  type = string 
}

variable "apis_to_enable" {
    type    = list(string)
    default = [
        "compute.googleapis.com"
    ]
}