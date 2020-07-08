output "application_endpoint" {
  value = "https://${module.lb.endpoint}"
}

output "application_health_check" {
  value = "https://${module.lb.endpoint}/_health_check"
}

output "iam_role" {
  value = aws_iam_role.ptfe.name
}

output "install_id" {
  value = module.common.install_id
}

output "installer_dashboard_password" {
  value = random_pet.console_password.id
}

output "installer_dashboard_url" {
  value = "https://${module.lb.endpoint}:8800"
}

## this allows the user to do `ssh -F ssh-config default`
resource "local_file" "ssh_config" {
  filename = "${path.root}/work/ssh-config"
  content  = data.template_file.ssh_config.rendered
}

output "primary_public_ip" {
  value = element(aws_instance.primary.*.public_ip, 0)
}

output "load_balancer_dns_name" {
  value = module.lb.lb_endpoint
}

output "load_balancer_zone_id" {
  value = module.lb.lb_zone_id
}

output "ssh_config_file" {
  value = local_file.ssh_config.filename
}

output "ssh_private_key" {
  value = module.common.ssh_priv_key_file
}

### Some small outputs to allow simpler testing of things like proxies
### as we need these bits to spin up an additional instance along side the cluster
### In the future we should probably be outputting resources.
output "ssh_key_name" {
  value = module.common.ssh_key_name
}

output "public_subnets" {
  value = module.common.public_subnets
}

output "intra_vpc_ingress_and_egress_sg_id" {
  value = module.common.intra_vpc_ingress_and_egress_sg_id
}

output "allow_ptfe_sg_id" {
  value = module.common.allow_ptfe_sg_id
}
