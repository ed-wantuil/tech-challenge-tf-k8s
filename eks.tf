resource "aws_eks_cluster" "eks_cluster" {
  name    = var.cluster_name
  version = var.eks_version
  role_arn = "arn:aws:iam::058264138215:role/LabRole"

  vpc_config {
    subnet_ids         = ["	subnet-056963b6d47b4b04a", "subnet-084f14e43b8753e6c"]
    security_group_ids = [aws_security_group.eks_sg.id]
  }
}
