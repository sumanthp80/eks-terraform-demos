module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  name = "eks-vpc1"
  cidr = "11.0.0.0/16"

  azs             = ["us-east-1a", "us-east-1b", "us-east-1c"]
  private_subnets = ["11.0.1.0/24", "11.0.2.0/24", "11.0.3.0/24"]
  public_subnets  = ["11.0.101.0/24", "11.0.102.0/24", "11.0.103.0/24"]
  enable_nat_gateway = true
  single_nat_gateway  = true
  one_nat_gateway_per_az = false

  public_subnet_tags = {
     "kubernetes.io/role/elb" = 1
 }

 private_subnet_tags = {
     "kubernetes.io/role/internal-elb" = 1
 }
  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
