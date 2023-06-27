# Used to grab subnet_id from subnet module
variable "subnet_id" {
  description = "The ID of the subnet where the instance will be created"
  type        = string
}
variable "vpc_id" {
  description = "The ID of the VPC where the security group will be created"
  type        = string
}

resource "aws_instance" "cues-ec2" {
  # Update with your desired AMI ID
  ami = "ami-022e1a32d3f742bd8" # Linux AMI ID
  instance_type = "t3.micro"
  key_name = aws_key_pair.ec2-key-pair.key_name
  vpc_security_group_ids = [aws_security_group.cues_sg.id]
  subnet_id = var.subnet_id
}


resource "aws_security_group" "cues_sg" {
  name = "cues-sg-using-terraform"
  vpc_id = var.vpc_id
  #Incoming traffic
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["98.212.123.227/32"] #replace it with your ip address
  }

  #Outgoing traffic
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["98.212.123.227/32"] #replace it with your ip address
  }
}
resource "aws_key_pair" "ec2-key-pair" {
  key_name = "ec2_key"
  public_key = file("./ec2_key_pair.pub")
}
