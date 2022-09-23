module "network" {
  source = "../vpc"
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  version = "~> 3.0"

  name = var.publicinstance_name

  ami                    = var.normalami
  instance_type          = var.instance_type
  key_name               = aws_key_pair.deployer.id
  monitoring             = true
  vpc_security_group_ids = tolist([module.network.securitygroupid])
  subnet_id              = module.network.publicsubnet[0]
  user_data              = <<-EOF
    #!/bin/bash
    sudo yum install http* -y
    sudo systemctl restart httpd
    sudo chown -R $USER:$USER /var/www/html
    sudo echo "<html><body><h1>Hello , This is the webserver</h1></body></html>" >> /var/www/html/index.html
    EOF

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_instance" "natinstance" {
  ami                         = var.natami
  instance_type               = var.instance_type
  subnet_id                   = module.network.publicsubnet[1]
  associate_public_ip_address = true
  source_dest_check           = false
  key_name                    = aws_key_pair.deployer.id
  vpc_security_group_ids      = tolist([module.network.securitygroupid])
  tags = {
    Name = "Nat instance "
  }
}

resource "aws_instance" "privateinstance" {
  ami                         = var.normalami
  instance_type               = var.instance_type
  subnet_id                   = module.network.privatesubnet[0]
  associate_public_ip_address = false
  key_name                    = aws_key_pair.deployer.id
  vpc_security_group_ids      = tolist([module.network.securitygroupid])
  tags = {
    Name = "private instance/db instance"
  }
}

resource "aws_route" "privateroute" {
  route_table_id         = module.network.privatert[0]
  destination_cidr_block = var.zerocidr
  instance_id            = aws_instance.natinstance.id

}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCafP3529OhllPgb/AAsNocfwbaQ6CVjPlBcUVqB4LCo/ArIHim7bymXKoN2V1UH1WaiTl5NKdwmLc64IevmMGMGOfk8HEj/vf1opYsH6Mi+/+v6akfwRDLtyt7V+yh3ceRRpVu8lolncTcITkayWnhy+GELVg4dTLOwx3oSr2W9QPqTsHbTdwaitZU4dHHGxH7NSNNFI6Orm4u86PORUF5vCGQBcyVAzXzZmQSTBIO5atO8zSKXcom7PkG2tPYXdhSBaibGlyrxDU17OTzZk1sP0EQqWORrmEMaO7daF0TvXQnsNvnvAU7CVr384JTZIez7wTJZRi/NDfyL9JsQ3xYxIIi77UwCBClnVDYEtwGYoOXZ+zejWCM3lNq6NC2QLHk8IfSwgT0FaGmcNJRPYUJ3I49ocs4WQgU7si2UgsW8gGMZdQHU6QMODIxpiEOeMdtq/xVpPO9eoJuWh/DpbVCISZY6Al1su2RXs1yzo50MGde9uJeFLYU9PXqvwQK/SM= ubuntu@ip-172-31-31-60"
}

resource "aws_security_group_rule" "myingress" {
  type              = "ingress"
  from_port         = 0
  to_port           = 65535
  protocol          = "tcp"
  cidr_blocks       = [var.zerocidr]
  ipv6_cidr_blocks  = [var.ipv6cidr]
  security_group_id = module.network.securitygroupid
}