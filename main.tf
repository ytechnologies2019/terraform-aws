## root/main.tf ##
module "vpc" {
  source           = "./vpc"
  vpc_cidr         = "10.1.0.0/16"
  public_sn_count  = 2
  private_sn_count = 3
  max_subnets      = 20
  public_subnet    = [for i in range(10, 102, 90) : cidrsubnet("10.1.0.0/16", "8", i)]
  private_subnet   = [for i in range(0, 254, 30) : cidrsubnet("10.1.0.0/16", "8", i)]
}

module "database" {
  source = "./database"
  allocated_storage    = var.allocated_storage
  engine               =  var.engine
  engine_version       =  var.engine_version
  instance_class       =  var.instance_class
  username             =  var.username
  password             =  var.password
  parameter_group_name =  var.parameter_group_name
  skip_final_snapshot  =  var.skip_final_snapshot
}