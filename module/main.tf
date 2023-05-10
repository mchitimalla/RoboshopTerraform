

resource "aws_instance" "instance" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.AllowAll.id]
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
resource "null_resource" "Provisioner" {
  depends_on = [aws_route53_record.record]
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline=[
      "rm -rf RoboshopAutomation",
      "git clone https://github.com/mchitimalla/RoboshopAutomation.git",
      "cd RoboshopAutomation",
      "sudo bash ${var.script_name}.sh ${var.password}"
    ]
  }
}