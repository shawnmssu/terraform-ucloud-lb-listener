provider "ucloud" {
  region = "cn-bj2"
}

module "uhost_instance" {
  source = "../../../terraform-ucloud-uhost-instance"

  instance_count   = 2
  instance_name    = "example-complete"
  password         = "ucloud_2019"
  image_name_regex = "^CentOS 7.[1-2] 64"
  instance_type    = "n-standard-2"
  tag              = "example-complete"
}

resource "ucloud_lb" "default" {
  name = "TF-LB"
  tag  = "example-complete"
}

module "lb_listener_http" {
  source           = "../../"
  load_balancer_id = "${ucloud_lb.default.id}"
  name             = "TF-Listener-Http"
  protocol         = "http"
  listen_type      = "request_proxy"
  frontend_port    = 80
  method           = "roundrobin"

  number_of_backends = 2
  backend_ids        = "${module.uhost_instance.instance_ids}"
  backend_port       = 80

  rule_domain = "www.ucloud.cn"
}

module "lb_listener_https" {
  source           = "../../"
  load_balancer_id = "${ucloud_lb.default.id}"
  name             = "TF-Listener-Https"
  protocol         = "https"
  listen_type      = "request_proxy"
  frontend_port    = 443
  method           = "roundrobin"

  number_of_backends = 2
  backend_ids        = "${module.uhost_instance.instance_ids}"
  backend_port       = 443

  rule_domain = "www.ucloud.cn"
}
