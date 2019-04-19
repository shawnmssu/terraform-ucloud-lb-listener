output "lb_id" {
  description = "The ID of LB listener"
  value       = "${ucloud_lb.default.id}"
}

output "lb_listener_ids" {
  description = "The list of ID of LB listener"
  value       = "[${module.lb_listener_http.this_listener_id}, ${module.lb_listener_https.this_listener_id}]"
}
