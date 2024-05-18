output "instance_info" {
    value = aws_instance.expense
  
}

output "ami_info" {
    value = data.aws_ami.ami_id
  
}