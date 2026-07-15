variable "project_name" {
  type = string
}

variable "environment" {
  type = string
}

variable "cluster_role_arn" {
  type = string
}

variable "worker_node_role_arn" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "kubernetes_version" {
  type = string
}

variable "instance_type" {
  type = string
}

variable "desired_size" {
  type = number
}

variable "min_size" {
  type = number
}

variable "max_size" {
  type = number
}

variable "common_tags" {
  type = map(string)
}
