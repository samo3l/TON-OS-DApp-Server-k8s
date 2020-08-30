# Declare AWS VPC variables
variable "region" {
  description = "AWS region"
}

variable "availability_zones" {
  description = "AWS availability zones"
}

variable "environment" {
  description = "Environment to tag the created resources"
}

variable "vpc_name" {
  description = "VPC name"
  default     = ""
}

variable "vpc_cidr" {
  description = "VPC CIDR"
  default     = "10.0.0.0/16"
}

variable "vpc_private_subnets" {
  description = "AWS VPC private subnets CIDRs"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "vpc_public_subnets" {
  description = "AWS VPC private subnets CIDRs"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}


# Declare AWS EKS variables
variable "cluster_name" {
  description = "Name of the EKS Cluster"
  default     = ""
}

variable "instance_type" {
  description = "Instance type used for the worker nodes"
  default     = "t2.medium"
}

variable "asg_min_size" {
  description = "Min nodes the cluster will have"
  default     = "5"
}

variable "asg_max_size" {
  description = "Max nodes the cluster will autoscale to"
  default     = "24"
}

variable "cluster_public_key" {
  description = "B64 encoded public key use to generate the aws-key-pair"
}

variable "cidr_workers_ssh" {
  description = "cidr blocks lists to accept ssh into workers"
  default = ["0.0.0.0/0"]
}
