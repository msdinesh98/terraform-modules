resource "aws_instance" "vm-01" {
  tags = {
    Name = "testVM"
  }
  ami = "var.ami_id"
  instance_type = "var.itype"
  key_name = "var.key"
  root_block_device {
    volume_size = 15
    volume_type = gp3
    delete_on_termination = true
    encrypted = true
  }
}