variable "vpc_id" {
  description = "The ID of the VPC in which to create the subnet"
  type        = string
}

resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = "10.0.0.0/24"  # Replace with your desired subnet CIDR block
  availability_zone       = "us-east-1a"  # Replace with your desired availability zone
  tags = {
    Name = "PrivateSubnet1"
  }
}