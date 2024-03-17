resource "aws_security_group" "eks_sg" {
  name   = "eks-sg"
  vpc_id = "vpc-0617283310e7606a6"

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
  role_arn = "arn:aws:iam::058264138215:role/LabRole"

  vpc_config {
    subnet_ids         = ["	subnet-056963b6d47b4b04a", "subnet-084f14e43b8753e6c"]
    security_group_ids = [aws_security_group.eks_sg.id]
  }
}
