## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| load\_balancer\_id | ID of the load balancer | string | n/a | yes |
| number\_of\_backends | List of instances ID to place in the LB listener | string | n/a | yes |
| backend\_ids | List of instances ID to place in the LB listener | list | `<list>` | no |
| backend\_port |  | string | `"80"` | no |
| name | The name of LB listener. | string | `"TF-Listener"` | no |
| protocol | The protocol of LB listener. Possible values: http, https, tcp, udp. | string | n/a | yes |
| listen\_type | The type of LB listener. Possible values: request_proxy, packets_transmit. | string | n/a | yes |
| frontend\_port | The port of LB listener | string | `"80"` | no |
| idle\_timeout | Amount of time in seconds to wait for the response for in between two sessions | string | `"60"` | no |
| method | The load balancer method in which the listener is. | string | `"roundrobin"` | no |
| persistence\_type | The type of session persistence of listener. Possible values: none, server_insert, user_defined. | string | `"none"` | no |
| persistence | A custom string will be exported if `persistence_type` is `user_defined`. | string | `""` | no |
| health\_check\_type | Health check method. Possible values are `port` as port checking and `path` as http checking. | string | `"port"` | no |
| health\_check\_domain | Health check domain checking. | string | `""` | no |
| health\_check\_path | Health check path checking. | string | `""` | no |
| rule\_domain | The domain of content forward matching fields. | string | `""` | no |
| rule\_path | The path of Content forward matching fields | string | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| this\_listener\_id | The ID of LB listener |

