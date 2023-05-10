data "aws_ami" "centosimage"{
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}
variable "app_servers" {}
resource "aws_instance" "instance" {
  for_each = var.app_servers
  ami           = data.aws_ami.centosimage.image_id
  instance_type = each.value["instance_type"]

  tags = {
    Name = each.value["name"]
  }
}
resource "aws_route53_record" "record" {
  depends_on = [aws_instance.instance]
  for_each = var.app_servers
  name    = "${each.value["name"]}.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =["aws_instance.${each.value["name"]}.private_ip"]
}
