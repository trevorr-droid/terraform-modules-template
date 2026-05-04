module "eks" {
  source = "../../modules/eks"

  name               = "demo-eks"
  region             = "us-west-2"
  vpc_id             = module.network.vpc_id
  private_subnet_ids = module.network.private_subnet_ids
  public_subnet_ids  = module.network.public_subnet_ids

  node_groups = {
    default = {
      instance_types = ["t3.medium"]
      desired_size   = 2
      min_size       = 1
      max_size       = 3
      disk_size      = 20
      labels         = { role = "default" }
      taints         = []
    }
  }

  tags = {
    module      = "eks"
    environment = "dev"
    owner       = "platform-team"
  }
}

