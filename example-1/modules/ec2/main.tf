# ------------------------------
# Security Group
# ------------------------------
resource "aws_security_group" "ec2_sg" {
  vpc_id = var.vpc_id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "demo-ec2-sg" }
}

resource "aws_security_group" "private_sg" {
  vpc_id = var.vpc_id
  name   = "private-ec2-sg"

  # Allow SSH only from the public EC2 security group
  ingress {
    description     = "Allow SSH only from public EC2"
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    security_groups = [aws_security_group.ec2_sg.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { Name = "private-ec2-sg" }
}
# ------------------------------
# Public EC2 Instance
# ------------------------------
resource "aws_instance" "public_ec2" {
  ami                         = data.aws_ami.amazon_linux.id
  instance_type               = var.instance_type
  subnet_id                   = var.aws_pub_sub
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]
  key_name               =  var.key_name
  associate_public_ip_address = true

  tags = {
    Name = "public-ec2"
  }
}

# ------------------------------
# Private EC2 Instance with IAM Role
# ------------------------------
resource "aws_instance" "private_ec2" {
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = var.instance_type
  subnet_id              = var.aws_pvt_sub
  vpc_security_group_ids = [aws_security_group.private_sg.id]
  key_name               = var.key_name
  iam_instance_profile   = var.ec2_profile

  tags = {
    Name = "private-ec2"
  }
}