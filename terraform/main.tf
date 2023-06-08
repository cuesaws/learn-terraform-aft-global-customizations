resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired VPC CIDR block
  
  tags = {
    Name = "MyVPC"
  }
}
resource "aws_subnet" "private_subnet_1" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.0.0/24"  # Replace with your desired subnet CIDR block
  availability_zone       = "us-east-1a"  # Replace with your desired availability zone
  tags = {
    Name = "PrivateSubnet1"
  }
}
