variable "load_balancer_id" {
  description = "ID of the load balancer"
}

variable "number_of_backends" {
  description = "List of instances ID to place in the LB listener"
}

variable "backend_ids" {
  description = "List of instances ID to place in the LB listener"
  type        = "list"
  default     = []
}

variable "backend_port" {
  description = ""
  default     = 80
}

# lb listener
variable "name" {
  description = "The name of LB listener."
  default     = "TF-Listener"
}

variable "protocol" {
  description = "The protocol of LB listener. Possible values: http, https, tcp, udp."
}

variable "listen_type" {
  description = "The type of LB listener. Possible values: request_proxy, packets_transmit."
}

variable "frontend_port" {
  description = "The port of LB listener"
  default     = 80
}

variable "idle_timeout" {
  description = "Amount of time in seconds to wait for the response for in between two sessions"
  default     = 60
}

variable "method" {
  description = "The load balancer method in which the listener is."
  default     = "roundrobin"
}

variable "persistence_type" {
  description = "The type of session persistence of listener. Possible values: none, server_insert, user_defined."
  default     = "none"
}

variable "persistence" {
  description = "A custom string will be exported if `persistence_type` is `user_defined`."
  default     = ""
}

variable "health_check_type" {
  description = "Health check method. Possible values are `port` as port checking and `path` as http checking."
  default     = "port"
}

variable "health_check_domain" {
  description = "Health check domain checking."
  default     = ""
}

variable "health_check_path" {
  description = "Health check path checking."
  default     = ""
}

# rule
variable "rule_domain" {
  description = "The domain of content forward matching fields."
  default     = ""
}

variable "rule_path" {
  description = "The path of Content forward matching fields"
  default     = ""
}
