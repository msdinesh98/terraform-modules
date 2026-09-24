#test-Env
module "test_instance" {
source = "../test/compute"
iname = "test-server"
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
