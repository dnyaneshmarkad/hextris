variable "name" {
  description = "The name of the kubernetes cluster"
  type = string
}

variable "node_image" {
  description = "The node_image that kind will use"
  type = string
}
