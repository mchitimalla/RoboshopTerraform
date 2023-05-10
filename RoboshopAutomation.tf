variable "app_servers" {}
module "app-servers" {
  for_each   = var.app_servers
  source         = "./module"
  component_name = each.value["name"]
 # env            = var.env
  instance_type  = each.value["instance_type"]
  password       = lookup(each.value, "password", "null")
  script_name    = each.value["script_name"]
}
