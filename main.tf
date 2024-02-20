## root/main.tf ##
module "vpc" {
  source         = "./vpc"
  vpc_cidr       = "10.0.0.0/16"
  public_sn_count= 2
  private_sn_count = 7
  max_subnets = 20
  public_subnet  = [for i in range(10 , 102 , 90) : cidrsubnet("10.0.0.0/16" , "8" , i)]
  private_subnet = [for i in range(0 , 254 , 30) : cidrsubnet("10.0.0.0/16" , "8" , i)]
}