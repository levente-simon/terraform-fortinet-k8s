resource "kubernetes_service_account" "fortigateconnector" {
  depends_on = [ fortios_firewall_policy.kube_cluster ]
  metadata {
    name = "fortigateconnector"
  }
}

resource "kubernetes_cluster_role" "fgt_connector" {
  metadata {
    name = "fgt-connector"
  }

  rule {
    api_groups = [""]
    resources  = ["pods", "namespaces", "nodes" , "services"]
    verbs      = ["get", "list", "watch"]
  }
}

resource "kubernetes_cluster_role_binding" "fgt_connector" {
  metadata {
    name = "fgt-connector"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = "fgt-connector"
  }
  subject {
    kind      = "ServiceAccount"
    name      = "fortigateconnector"
  }
}

data "kubernetes_secret" "fgt_connector" {
  metadata {
    name      = kubernetes_service_account.fortigateconnector.default_secret_name
  }
}

resource "fortios_json_generic_api" "kube_cluster" {
  depends_on = [ fortios_firewall_ldbmonitor.ping-mon ]

  path   = "/api/v2/cmdb/system/sdn-connector"
  method = "POST"
  json   = format(local.k8s_connector_template,
                   "k8s-${var.cluster_name}",
                   var.lb_extip,
                   data.kubernetes_secret.fgt_connector.data.token
                 )
}


