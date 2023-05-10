data "aws_ami" "centosimage"{
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}
data "aws_security_group" "AllowAll"{
  name="MyRoboGroupAllowAll"
}