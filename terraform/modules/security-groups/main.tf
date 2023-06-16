
resource "aws_security_group" "cues_sg" {
  name = "cues-sg-using-terraform"

  #Incoming traffic
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["11.xx.xx.xx/32"] #replace it with your ip address
  }

  #Outgoing traffic
  egress {
    from_port = 0
    protocol = "-1"
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_key_pair" "ec2-key-pair" {
  key_name = "ec2_key"
  public_key = file("./ssh-keys/ec2-key-pair.pub")
}