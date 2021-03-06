variable "cluster_name"               { type = string   }
variable "cluster_hosts"              { type = map(any) }
variable "lb_extip"                   { type = string   }
variable "lb_dstintf"                 { type = string   }

variable "forti_hostname" {
  type      = string
  sensitive = true
}

variable "forti_token" {
  type     = string
  sensitive = true
}

variable "k8s_host" {
  type      = string
  sensitive = true
}

variable "k8s_client_certificate" {
  type      = string
  sensitive = true
  default   = ""
}

variable "k8s_client_key" {
  type      = string
  sensitive = true
  default   = ""
}

variable "k8s_cluster_ca_certificate" {
  type      = string
  sensitive = true
  default   = ""
}

variable "k8s_cluster_client_token" {
  type      = string
  sensitive = true
  default   = ""
}

variable "lb_srcintf" {
  type    = string
  default = "any"
}

variable "lb_srcaddr" {
  type    = list(string)
  default = [ "all" ]
}

variable "lb_service" {
  type    = list(string)
  default = [ "HTTPS", "HTTP" ]
}
