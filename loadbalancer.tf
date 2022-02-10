variable "module_depends_on" {
  type    = any
  default = []
}

resource "fortios_firewall_ldbmonitor" "ping-mon" {
  depends_on         = [ var.module_depends_on ]

  interval           = 10
  name               = "ping-mon-${var.cluster_name}"
  retry              = 3
  timeout            = 2
  type               = "ping"
}

resource "fortios_firewall_vip" "vip" {

  name    = "lb-${var.cluster_name}"
  comment = ""
  type    = "server-load-balance"
  extip   = var.lb_extip
  extport = 6443
  extintf = "any"
  server_type = "https"
  http_ip_header = "enable"
  monitor {
    name = "ping-mon-${var.cluster_name}"
  }
  color = 21
  ldb_method = "round-robin"
 
  dynamic "realservers" {
    for_each = var.cluster_hosts
    content {
      id = realservers.value.id
      ip = realservers.value.ip
      port = 6443
    }
  }
  ssl_certificate = "lsimon.tplinkdns.com.crt"
  ssl_mode = "full"
}

resource "fortios_firewall_policy" "kube_cluster" {
  depends_on      = [ fortios_firewall_vip.vip ]

  action          = "accept"
  name            = var.cluster_name
  schedule        = "always"
  inspection_mode = "proxy"
  nat             = "enable"

  srcintf { name = var.lb_srcintf      }
  dynamic "srcaddr" {
    for_each = { for i in var.lb_srcaddr: i => i }
    content {
      name     = srcaddr.value
    }
  }

  dstintf { name = var.lb_dstintf   }
  dstaddr { name = "lb-${var.cluster_name}" }

  dynamic "service" {
    for_each = { for i in var.lb_service: i => i }
    content {
      name     = service.value
    }
  }
}

