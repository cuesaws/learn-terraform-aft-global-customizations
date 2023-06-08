resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"  # Replace with your desired VPC CIDR block
  
  tags = {
    Name = "MyVPC"
  }
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.my_vpc.id
}