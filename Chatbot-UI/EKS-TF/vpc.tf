##########################
# Existing VPC
##########################

data "aws_vpc" "vpc" {
  id = "vpc-0610e288ad79cc052"
}

##########################
# Existing Internet Gateway
##########################

data "aws_internet_gateway" "igw" {
  filter {
    name   = "attachment.vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

##########################
# Public Subnet
##########################

resource "aws_subnet" "public_subnet2" {
  vpc_id                  = "vpc-0610e288ad79cc052"
  cidr_block              = "172.31.64.0/20"   # Use an unused CIDR
  availability_zone       = "eu-north-1b"
  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet-2"
  }
}

##########################
# Route Table
##########################

resource "aws_route_table" "rt2" {
  vpc_id = data.aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = data.aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public-route-table"
  }
}

##########################
# Route Table Association
##########################

resource "aws_route_table_association" "rt_association2" {
  subnet_id      = aws_subnet.public_subnet2.id
  route_table_id = aws_route_table.rt2.id
}
