module "ec2_demo" {
  source       = "./modules/ec2"
  env_vars     = var.env_vars
  ec2_instances = var.ec2_instances
  region =  var.aws_region
}

# module "s3_bucket" {
#   source = "terraform-aws-modules/s3-bucket/aws"

#   bucket = "my-s3-bucket"
#   acl    = "private"

#   control_object_ownership = true
#   object_ownership         = "ObjectWriter"

#   versioning = {
#     enabled = true
#   }
# }


resource "null_resource" "list_buckets" {
  provisioner "local-exec" {
    command = "aws s3 ls --region ${var.aws_region}"
  }
  triggers = {
    always= timestamp()
  }
}


resource "aws_s3_bucket" "import_demo" {
  bucket = "demo-bucket-import123"
}

# resource "null_resource" "remote_command" {
#   depends_on = [aws_instance.demo]

#   provisioner "remote-exec" {
#     inline = [
#       "echo 'Terraform connected to EC2 successfully!' > /tmp/hello.txt",
#       "sudo yum install -y tree",
#       "tree /var | head -5"
#     ]

#     connection {
#       type        = "ssh"
#       user        = "ec2-user"
#       private_key = file("~/.ssh/my-key.pem")
#       host        = aws_instance.demo.public_ip
#     }
#   }
# }


