resource "aws_security_group" "this" {
  name        = var.sg_name
  description = "Allow inbound traffic for Kubernetes cluster"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = merge(var.common_tags, {
    Name = var.sg_name
  })
}
