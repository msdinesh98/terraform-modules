#Dev-Env
module "dev_instance" {
source = "/root/envs/dev/compute/"
iname = "dev-server"
itype = "t3.micro"
ami_id = "ami-07fdf51168766b58a"
}

module "dev_securitygrp" {
  source = "/root/envs/dev/network/"
  mysg = "dev-sg"
  ports = [22, 80, 443]
}
module "dev_storage" {
  source = "/root/envs/dev/storage/"
  mys3 = "dev_bucket_msd_one"
}
#Stage-Env
module "stage_instance" {
source = "/root/envs/stage/compute/"
iname = "stage-server"
itype = "t3.micro"
ami_id = "ami-07fdf51168766b58a"
}

module "stage_securitygrp" {
  source = "/root/envs/stage/network/"
  mysg = "stage-sg"
  ports = [22, 80, 443]
}
module "stage_storage" {
  source = "/root/envs/stage/storage/"
  mys3 = "stage_bucket_msd_one"
}
#Prod-Env
module "prod_instance" {
source = "/root/envs/prod/compute/"
iname = "prod-server"
itype = "t3.micro"
ami_id = "ami-07fdf51168766b58a"
}

module "prod_securitygrp" {
  source = "/root/envs/prod/network/"
  mysg = "prod-sg"
  ports = [22, 80, 443]
}
module "prod_storage" {
  source = "/root/envs/prod/storage/"
  mys3 = "prod_bucket_msd_one"
}
