# AWS VPC + EKS + HELM using terraform

Upwork project for Val Spiridonov

## Getting Started

These instructions will describe how to spin up AWS VPC + EKS + HELM using terraform

### Prerequisites for running terrafrom scripts

Terraform installed. See - https://learn.hashicorp.com/terraform/getting-started/install.html.

### Variables

Variables are described in the variables.tf file. But input values for those variables are in the terraform.tfvars file, so use it to override.

### Runing terraform

Export variables with credentials
```
export AWS_ACCESS_KEY_ID="anaccesskey"
export AWS_SECRET_ACCESS_KEY="asecretkey"
export AWS_DEFAULT_REGION="us-west-2"
```
Navigate to project dir
```
cd terraform-vpc-eks-helm
```
Init providers
```
terraform init
```
Plan and see resources will be created
```
terraform plan
```
Create them
```
terraform apply
```
Destroy resources 
```
terraform destroy
```
