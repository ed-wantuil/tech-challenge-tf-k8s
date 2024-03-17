provider "aws" {
  region = "us-east-1"
}
#
#resource "aws_vpc" "eks_vpc" {
#  cidr_block = "10.0.0.0/16"
#  tags       = {
#    Name                                = "eks-vpc"
#    "kubernetes.io/cluster/eks-cluster" = "shared"
#  }
#}
#
#resource "aws_subnet" "private" {
#  count                   = length(var.private_subnets)
#  vpc_id                  = aws_vpc.eks_vpc.id
#  cidr_block              = var.private_subnets[count.index]
#  availability_zone       = var.azs[count.index]
#  map_public_ip_on_launch = false
#
#  tags = {
#    Name                                = "private-${var.azs[count.index]}"
#    "kubernetes.io/cluster/eks-cluster" = "shared"
#  }
#}
#
#resource "aws_subnet" "public" {
#  count                   = length(var.public_subnets)
#  vpc_id                  = aws_vpc.eks_vpc.id
#  cidr_block              = var.public_subnets[count.index]
#  availability_zone       = var.azs[count.index]
#  map_public_ip_on_launch = true
#
#  tags = {
#    Name                                = "public-${var.azs[count.index]}"
#    "kubernetes.io/cluster/eks-cluster" = "shared"
#  }
#}
#
#resource "aws_nat_gateway" "nat" {
#  count         = var.enable_nat_gateway ? length(var.public_subnets) : 0
#  subnet_id     = element(aws_subnet.public.*.id, count.index)
#  allocation_id = aws_eip.nat[count.index].id
#  depends_on    = [aws_internet_gateway.igw]
#}
#
#resource "aws_eip" "nat" {
#  count = var.enable_nat_gateway ? length(var.public_subnets) : 0
#  vpc   = true
#}
#
#resource "aws_internet_gateway" "igw" {
#  vpc_id = aws_vpc.eks_vpc.id
#  tags   = {
#    Name                                = "eks-igw"
#    "kubernetes.io/cluster/eks-cluster" = "shared"
#  }
#}
