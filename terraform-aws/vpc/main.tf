## vpc/main.tf ##
data "aws_availability_zones" "available" {
  state = "available"
}

resource "random_shuffle" "az" {
  input        = data.aws_availability_zones.available.names
  result_count = var.max_subnets
}

resource "random_integer" "random" {
  min = 1
  max = 99
}

resource "aws_vpc" "terraform-vpc" {
    cidr_block = var.vpc_cidr
    tags = {
      Name = "terraform-vpc-${random_integer.random.id}"
    }
}

resource "aws_subnet" "public_subnet" {
  count      =var.public_sn_count
  vpc_id     = aws_vpc.terraform-vpc.id
  availability_zone = random_shuffle.az.result[count.index]
  cidr_block = var.public_subnet[count.index]

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  count      = var.private_sn_count
  vpc_id     = aws_vpc.terraform-vpc.id
  cidr_block = var.private_subnet[count.index]
  availability_zone = random_shuffle.az.result[count.index]

  tags = {
    Name = "private_subnet"
  }
}