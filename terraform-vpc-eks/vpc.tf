# Terrafrom AWS VPC module will be used - https://registry.terraform.io/modules/terraform-aws-modules/vpc/aws/2.22.0

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.vpc_name
  cidr = var.vpc_cidr

  azs             = var.availability_zones
  private_subnets = var.vpc_private_subnets
  public_subnets  = var.vpc_public_subnets

  enable_nat_gateway  = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_vpn_gateway  = false
  enable_dhcp_options = false

  tags = {
    Name        = var.vpc_name
    Environment = var.environment
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
  }

  public_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/elb" = "1"
  }
  

  private_subnet_tags = {
    "kubernetes.io/cluster/${var.cluster_name}" = "shared"
    "kubernetes.io/role/internal-elb" = "1"
  }
}
