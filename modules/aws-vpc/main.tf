resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr_block

  tags = merge(var.common_tags, {
    Name = var.vpc_name
  })
}

resource "aws_subnet" "private" {
  count = length(var.private_subnet_cidrs)

  cidr_block = var.private_subnet_cidrs[count.index]
  vpc_id     = aws_vpc.this.id

  tags = merge(var.common_tags, {
    Name = "${var.vpc_name}-private-subnet-${count.index + 1}"
  })
}
