data "aws_ami" "centosimage"{
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}

resource "aws_instance" "instance" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = var.instance_type

  tags = {
    Name = var.component_name
  }
}
resource "aws_route53_record" "record" {
  depends_on = [aws_instance.instance]
    name    = "${var.component_name}.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.instance.private_ip]
}