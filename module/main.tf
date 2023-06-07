

resource "aws_instance" "instance" {

  ami           = data.aws_ami.centosimage.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [data.aws_security_group.AllowAll.id]
  tags = {
    Name = var.component_name
  }
  iam_instance_profile = aws_iam_instance_profile.instance_profile.name
  #instance_interruption_behavior = "stop"
}
resource "aws_route53_record" "record" {
  depends_on = [aws_instance.instance]
  name    = "${var.component_name}-${var.env}.eroboshop.online"
  type    = "A"
  zone_id = "Z02749461DPP5346XTQCJ"
  ttl = 30
  records =[aws_instance.instance.private_ip]
}
resource "null_resource" "Provisioner" {
  depends_on = [aws_route53_record.record]
  count = var.provisioner ? 1 : 0
  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }
    inline= var.app_type == "db" ? local.db_commands : local.app_commands

  }
}
resource "aws_iam_role" "role" {
  name = "${var.component_name}-${var.env}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "${var.component_name}-${var.env}-role"
  }
}
resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.component_name}-${var.env}-profile"
  role = aws_iam_role.role.name
}
resource "aws_iam_role_policy" "ssm-ps-policy" {
  name = "${var.component_name}-${var.env}-ssm-ps-policy"
  role = aws_iam_role.role.id


  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Sid": "VisualEditor0",
        "Effect": "Allow",
        "Action": [
          "ssm:GetParameterHistory",
          "ssm:GetParametersByPath",
          "ssm:GetParameters",
          "ssm:GetParameter"
        ],
        "Resource": "arn:aws:ssm:us-east-1:804239253946:parameter/dev.cart.*"
      },
      {
        "Sid": "VisualEditor1",
        "Effect": "Allow",
        "Action": [
          "kms:GetParametersForImport",
          "kms:ListKeys",
          "kms:Decrypt",
          "kms:ListKeyPolicies",
          "kms:ListRetirableGrants",
          "ssm:DescribeParameters",
          "kms:ListAliases",
          "kms:ListResourceTags",
          "kms:ListGrants"
        ],
        "Resource": "*"
      }
    ]
  })
}
