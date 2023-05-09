data "aws_ami" "centosimage"{
  owners = ["973714476881"]
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
}
resource "aws_instance" "Frontend" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Frontend"
  }
}
resource "aws_route53_record" "frontend" {
  name    = "frontend.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.Frontend.private_ip]
}
resource "aws_instance" "Mongodb" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Mongodb"
  }
}
resource "aws_route53_record" "mongodb" {
  name    = "mongodb.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.Mongodb.private_ip]
}
resource "aws_instance" "Catalogue" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Catalogue"
  }
}
resource "aws_route53_record" "catalogue" {
  name    = "catalogue.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.Catalogue.private_ip]
}
resource "aws_instance" "Cart" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Cart"
  }
}
resource "aws_route53_record" "Cart" {
  name    = "cart.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.Cart.private_ip]
}
resource "aws_instance" "User" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "User"
  }
}
resource "aws_route53_record" "User" {
  name    = "user.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.User.private_ip]
}
resource "aws_instance" "MySql" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "MySql"
  }
}
resource "aws_route53_record" "Mysql" {
  name    = "mysql.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.MySql.private_ip]
}
resource "aws_instance" "Redis" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Redis"
  }
}
resource "aws_route53_record" "Redis" {
  name    = "redis.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.Redis.private_ip]
}
resource "aws_instance" "RabbitMQ" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "RabbitMQ"
  }
}
resource "aws_route53_record" "RabbitMQ" {
  name    = "rabbitmq.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.RabbitMQ.private_ip]
}
resource "aws_instance" "Payment" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Payment"
  }
}
resource "aws_route53_record" "Payment" {
  name    = "payment.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.Payment.private_ip]
}
resource "aws_instance" "Shipping" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Shipping"
  }
}
resource "aws_route53_record" "Shipping" {
  name    = "shipping.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.Shipping.private_ip]
}
resource "aws_instance" "Dispatch" {
  ami           = data.aws_ami.centosimage.image_id
  instance_type = "t3.micro"

  tags = {
    Name = "Dispatch"
  }
}
resource "aws_route53_record" "Dispatch" {
  name    = "dispatch.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.Dispatch.private_ip]
}