resource "aws_instance" "cues-ec2" {
  # Update with your desired AMI ID
  ami = "ami-0b54418bdd76353ce" # Linux AMI ID
  instance_type = "t2.micro"
  key_name = var.key_name
  security_groups = ["cues-ec2-sg-aft"]
}

variable "key_name" {
  description = "The key name to be used by the EC2 instance"
  type        = string
}
