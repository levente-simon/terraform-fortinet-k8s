locals {
  k8s_connector_template = <<EOF
{
  "name": "%s",
  "type": "kubernetes",
  "verify-certificate": "disable",
  "server": "%s",
  "secret-token": "%s"
}
EOF
}

