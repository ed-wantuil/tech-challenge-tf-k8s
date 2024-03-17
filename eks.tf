resource "aws_eks_cluster" "eks_cluster" {
  name    = var.cluster_name
  version = var.eks_version
  role_arn = "arn:aws:iam::058264138215:role/LabRole"

  vpc_config {
    subnet_ids         = ["subnet-056963b6d47b4b04a", "subnet-084f14e43b8753e6c"]
    security_group_ids = ["sg-0afbb6ab8e72f0925"]
  }
}


resource "aws_eks_fargate_profile" "fargate_profile" {
  cluster_name           = aws_eks_cluster.eks_cluster.name
  fargate_profile_name   = "fargate"
  pod_execution_role_arn = "arn:aws:iam::058264138215:role/LabRole"

  subnet_ids = ["subnet-056963b6d47b4b04a", "subnet-084f14e43b8753e6c"]

  selector {
    namespace = "kube-system"
  }
}