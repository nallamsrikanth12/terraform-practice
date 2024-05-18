resource "aws_instance" "expense" {
  count = length(var.instance_names)
  ami           = data.aws_ami.ami_id.id
  instance_type = var.instance_names == "db" ? "t3.small" : "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]

  tags = merge(
        var.common_tags,
        {
        Name = var.instance_names[count.index]
        module = var.instance_names[count.index]

        }
    )
        
}



resource "aws_security_group" "allow_tls" {
  name        = var.sg_name
  description = "Allow TLS inbound traffic and all outbound traffic"
  

  ingress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
   egress {
        from_port        = 0
        to_port          = 0
        protocol         = "-1"
        cidr_blocks      = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }

  tags = {
    Name = "allow_tls"
  }
}
