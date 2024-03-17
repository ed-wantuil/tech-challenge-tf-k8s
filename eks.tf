data "aws_vpc" "existing_vpc" {
  id = "vpc-123456"
}

resource "aws_security_group" "eks_sg" {
  name   = "eks-sg"
  vpc_id = data.aws_vpc.existing_vpc.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "udp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_eks_cluster" "eks_cluster" {
  name    = var.cluster_name
  version = var.eks_version

  vpc_config {
    subnet_ids         = ["subnet-12345", "subnet-67890"]
    security_group_ids = [aws_security_group.eks_sg.id]
  }
}
