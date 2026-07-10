output "dev_server_details" {
  value = [aws_instance.dev_ins.id, aws_instance.dev_ins.public_ip]
}
