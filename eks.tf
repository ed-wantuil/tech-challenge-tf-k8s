provider "aws" {
  region = "us-east-1"
}

data "aws_ami" "eks_worker" {
  filter {
    name   = "eks-techchallenge"
    values = ["amazon-eks-node-v1.18.8-20200610"]
  }

  most_recent = true
  owners      = ["602401143452"] # Amazon
}

module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.1.0"
  cluster_name    = "eks-cluster"
  cluster_version = "1.21"
  subnets         = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1

      instance_type = "m5.large"
      key_name      = "your-key-pair-name"
    }
  }
}