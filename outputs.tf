output "server_config" {
	value = "${data.template_file.server_config.*.rendered}"
}

output "acl_config" {
	value = "${data.template_file.acl_config.*.rendered}"
}

output "client_config" {
	value = "${data.template_file.client_config.*.rendered}"
}
