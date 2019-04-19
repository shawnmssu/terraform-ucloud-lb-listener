resource "ucloud_lb_listener" "default" {
  load_balancer_id = "${var.load_balancer_id}"

  name        = "${var.name}"
  protocol    = "${var.protocol}"
  listen_type = "${var.listen_type}"

  port             = "${var.frontend_port}"
  idle_timeout     = "${var.idle_timeout}"
  method           = "${var.method}"
  persistence_type = "${var.persistence_type}"
  persistence      = "${var.persistence}"

  health_check_type = "${var.health_check_type}"
  domain            = "${var.health_check_domain}"
  path              = "${var.health_check_path}"
}

resource "ucloud_lb_attachment" "default" {
  load_balancer_id = "${var.load_balancer_id}"
  listener_id      = "${ucloud_lb_listener.default.id}"
  resource_id      = "${var.backend_ids[count.index]}"
  port             = "${var.backend_port}"
  count            = "${var.number_of_backends}"
}

resource "ucloud_lb_rule" "domain" {
  count            = "${(var.rule_domain == "") ? 0 : 1}"
  load_balancer_id = "${var.load_balancer_id}"
  listener_id      = "${ucloud_lb_listener.default.id}"
  backend_ids      = ["${ucloud_lb_attachment.default.*.id}"]
  domain           = "${var.rule_domain}"
}

resource "ucloud_lb_rule" "path" {
  count            = "${(var.rule_path == "") ? 0 : 1}"
  load_balancer_id = "${var.load_balancer_id}"
  listener_id      = "${ucloud_lb_listener.default.id}"
  backend_ids      = ["${ucloud_lb_attachment.default.*.id}"]
  path             = "${var.rule_path}"
}
