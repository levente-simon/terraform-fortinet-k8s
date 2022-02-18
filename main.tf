terraform {
  required_providers {
    fortios = {
      source = "fortinetdev/fortios"
      version = ">= 1.14.0"
    }
  }
}

provider "fortios" {
  hostname     = var.forti_hostname
  token        = var.forti_token
  insecure     = true
}

provider "kubernetes" {
  host                   = var.k8s_host
  client_certificate     = var.k8s_client_certificate
  client_key             = var.k8s_client_key
  cluster_ca_certificate = var.k8s_cluster_ca_certificate
  token                  = var.k8s_cluster_client_token

}

