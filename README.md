## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_fortios"></a> [fortios](#requirement\_fortios) | >= 1.14.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_fortios"></a> [fortios](#provider\_fortios) | >= 1.14.0 |
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | n/a |
| <a name="provider_time"></a> [time](#provider\_time) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [fortios_firewall_ldbmonitor.ping_mon](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/firewall_ldbmonitor) | resource |
| [fortios_firewall_policy.kube_cluster](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/firewall_policy) | resource |
| [fortios_firewall_vip.vip](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/firewall_vip) | resource |
| [fortios_json_generic_api.kube_cluster](https://registry.terraform.io/providers/fortinetdev/fortios/latest/docs/resources/json_generic_api) | resource |
| [kubernetes_cluster_role.fgt_connector](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role) | resource |
| [kubernetes_cluster_role_binding.fgt_connector](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/cluster_role_binding) | resource |
| [kubernetes_service_account.fortigateconnector](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/resources/service_account) | resource |
| [time_sleep.wait_for_ping_mon](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [time_sleep.wait_for_vip](https://registry.terraform.io/providers/hashicorp/time/latest/docs/resources/sleep) | resource |
| [kubernetes_secret.fgt_connector](https://registry.terraform.io/providers/hashicorp/kubernetes/latest/docs/data-sources/secret) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_hosts"></a> [cluster\_hosts](#input\_cluster\_hosts) | n/a | `map(any)` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_forti_hostname"></a> [forti\_hostname](#input\_forti\_hostname) | n/a | `string` | n/a | yes |
| <a name="input_forti_token"></a> [forti\_token](#input\_forti\_token) | n/a | `string` | n/a | yes |
| <a name="input_k8s_host"></a> [k8s\_host](#input\_k8s\_host) | n/a | `string` | n/a | yes |
| <a name="input_lb_dstintf"></a> [lb\_dstintf](#input\_lb\_dstintf) | n/a | `string` | n/a | yes |
| <a name="input_lb_extip"></a> [lb\_extip](#input\_lb\_extip) | n/a | `string` | n/a | yes |
| <a name="input_k8s_client_certificate"></a> [k8s\_client\_certificate](#input\_k8s\_client\_certificate) | n/a | `string` | `""` | no |
| <a name="input_k8s_client_key"></a> [k8s\_client\_key](#input\_k8s\_client\_key) | n/a | `string` | `""` | no |
| <a name="input_k8s_cluster_ca_certificate"></a> [k8s\_cluster\_ca\_certificate](#input\_k8s\_cluster\_ca\_certificate) | n/a | `string` | `""` | no |
| <a name="input_k8s_cluster_client_token"></a> [k8s\_cluster\_client\_token](#input\_k8s\_cluster\_client\_token) | n/a | `string` | `""` | no |
| <a name="input_lb_service"></a> [lb\_service](#input\_lb\_service) | n/a | `list(string)` | <pre>[<br>  "HTTPS",<br>  "HTTP"<br>]</pre> | no |
| <a name="input_lb_srcaddr"></a> [lb\_srcaddr](#input\_lb\_srcaddr) | n/a | `list(string)` | <pre>[<br>  "all"<br>]</pre> | no |
| <a name="input_lb_srcintf"></a> [lb\_srcintf](#input\_lb\_srcintf) | n/a | `string` | `"any"` | no |
| <a name="input_module_depends_on"></a> [module\_depends\_on](#input\_module\_depends\_on) | n/a | `any` | `[]` | no |

## Outputs

No outputs.
