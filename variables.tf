# Consul Configuration File
variable "server_domain" {}
variable "server_hostnames" {
	type = "map"
}

# Server Config File
data "template_file" "server_config" {
	count = "${length(var.server_hostnames)}"
	template = "${file("${path.module}/server/config.json")}"

	vars {
		node_name = "consul-central-${count.index + 1}"
		server_domain = "${var.server_domain}"
	}
}

# Client Config File
data "template_file" "client_config" {
	template = "${file("${path.module}/client/config.json")}"

	vars {
		node_name = "consul-central-client"
		server_domain = "${var.server_domain}"
	}
}
