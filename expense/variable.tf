# ec2 variables

variable "instance_names" {
    default = ["db", "backend", "frontend"]
  
}

variable "ami_id" {
    default = "ami-090252cbe067a9e58"
  
}

variable "common_tags" {
    default = {
        env = "dev"
        date = "17-05-2024"
        terraform = "true"
    }
  
}


variable "sg_name" {
    default = "allow_tls"
}

# r53 records

variable "domain_name" {
    default = "srikantheswar.online"
  
}

variable "zone_id" {
 default = "Z09728512G1GJV5UP5N8L" 
}
