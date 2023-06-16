resource "aws_instance" "cues-ec2" {
  ami = "ami-0b54418bdd76353ce" # Update with your desired AMI ID
  instance_type = "t2.micro"
  key_name = aws_key_pair.ec2_key.key_name
  security_groups = ["cues-ec2-sg-aft"]
}