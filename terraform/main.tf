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

resource "aws_subnet" "private_subnet_2" {
  vpc_id                  = aws_vpc.my_vpc.id
  cidr_block              = "10.0.1.0/24"  
  availability_zone       = "us-east-1b"

  tags = {
    Name = "PrivateSubnet2"
  }
}

resource "aws_route_table" "my_route_table" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_ec2_transit_gateway.my_transit_gateway.id
  }

  tags = {
    Name = "MyRouteTable"
  }
}
resource "aws_ec2_transit_gateway" "my_transit_gateway" {
  description = "Shared Transit Gateway"
}

 

# Output

output "vpc_id" {

  value = aws_vpc.my_vpc.id

}

 

output "subnet_ids" {

  value = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]

}

 

output "route_table_id" {

  value = aws_route_table.my_route_table.id

}

 

output "transit_gateway_id" {

  value = aws_ec2_transit_gateway.my_transit_gateway.id

}