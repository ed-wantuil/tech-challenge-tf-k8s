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
  cluster_version = "1.18"
  subnets         = ["subnet-abcde012", "subnet-bcde012a", "subnet-fghi345a"]
  vpc_id          = "vpc-abcde012"

  node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 1

      instance_type = "m4.large"
      key_name      = "eks"

      root_block_device_size = "50"

      source_security_group_ids = ["sg-0123456abcde7890a"]

      additional_tags = {
        Environment = "production"
        Name        = "eks-worker-node"
      }
    }
  }
}