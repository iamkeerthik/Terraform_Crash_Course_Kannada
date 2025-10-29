# ------------------------
# EC2 creation using for_each
# ------------------------
resource "aws_instance" "this" {
  for_each = var.region == "ap-south-1" ? var.ec2_instances : {}

  ami           = each.value.ami
  instance_type = each.value.instance_type

  # Auto-generated name using prefix
  tags = merge(local.common_tags, {
    Name = replace("${local.name_prefix}-${each.value.name}", "-", "_")
  })
}