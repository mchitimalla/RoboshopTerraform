locals {
  name = var.env != "" ? "${var.component_name}-${var.env}" : var.component_name
  db_commands = [
    "rm -rf RoboshopAutomation",
    "git clone https://github.com/mchitimalla/RoboshopAutomation.git",
    "cd RoboshopAutomation",
    "sudo bash ${var.script_name}.sh ${var.password}"
  ]
  app_commands = [
    "sudo labauto ansible",
    "ansible-pull -i localhost, -U https://github.com/mchitimalla/RoboshopAnsible.git roboshopansi.yml -e env=${var.env} -e role_name=${var.component_name}"
  ]
}