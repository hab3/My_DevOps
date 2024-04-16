resource "aws_vpc" "demo_vpc" {
  cidr_block = "10.0.0.0/16"


  tags = {
    Name = "demo-vpc"
    Env  = "demo"
  }
}

resource "aws_internet_gateway" "demo_gw" {
  vpc_id = aws_vpc.demo_vpc.id

  tags = {
    Name = "demo_vpc_gw"
  }
}


resource "aws_subnet" "public_subnet" {
  count                   = 2
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = element(["10.0.0.0/24", "10.0.1.0/24"], count.index) # Adjust CIDR blocks as needed
  availability_zone       = element(var.zones[var.region], count.index)          # Change to desired availability zones   CHANGED
  map_public_ip_on_launch = true

  tags = {
    Name = "public_subnet_demo"
  }
}



# Create private subnets similarly.
resource "aws_subnet" "private_subnet" {
  count                   = 1
  vpc_id                  = aws_vpc.demo_vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = element(var.zones[var.region], count.index) # Change to desired availability zones CHANGED
  map_public_ip_on_launch = false

  tags = {
    Name = "private_demo_vpc"
  }
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.demo_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.demo_gw.id
  }
}

resource "aws_route_table_association" "subnet_association" {
  count          = 2
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public_route_table.id
}

# Output the VPC id
output "Demo_vpc_id" {
  value = aws_vpc.demo_vpc.id
}
