resource "aws_instance" "cues-ec2" {
  # Update with your desired AMI ID
  ami = "ami-0b54418bdd76353ce" # Linux AMI ID
  instance_type = "t2.micro"
  key_name = aws_key_pair.ec2-key-pair.key_name
  security_groups = ["cues-ec2-sg-aft"]
}