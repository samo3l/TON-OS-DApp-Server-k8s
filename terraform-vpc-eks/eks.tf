# Terrafrom AWS EKS module will be used - https://registry.terraform.io/modules/terraform-aws-modules/eks/aws/8.0.0

module "eks" {
  source       = "terraform-aws-modules/eks/aws"
  cluster_name = var.cluster_name
  subnets      = module.vpc.private_subnets
#  subnets      = ["module.vpc.public_subnets", "module.vpc.private_subnets"]
  tags         = "${map(var.cluster_name, var.environment)}"
  vpc_id       = module.vpc.vpc_id

  worker_groups = [
    {
      asg_desired_capacity  = var.asg_min_size
      asg_max_size          = var.asg_max_size
      asg_min_size          = var.asg_min_size
      instance_type         = var.instance_type
      name                  = "workers"
      autoscaling_enabled   = true
      protect_from_scale_in = false
      key_name              = aws_key_pair.eks.key_name
      subnets               = module.vpc.private_subnets
    }
  ]
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}

provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
  token                  = data.aws_eks_cluster_auth.cluster.token
  load_config_file       = false
  version                = "~> 1.10"
}

resource "aws_key_pair" "eks" {
  key_name   = var.cluster_name
  public_key = base64decode(var.cluster_public_key)
}

resource "aws_security_group" "all_worker_mgmt" {
  name_prefix = "all_worker_management"
  vpc_id      = module.vpc.vpc_id

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = var.cidr_workers_ssh
  }
}
