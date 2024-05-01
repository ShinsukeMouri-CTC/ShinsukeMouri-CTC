resource "aws_default_route_table" "main" {
  default_route_table_id = aws_vpc.main.default_route_table_id
  tags = {
    Name = "2h9942-rtb-default"
  }
}
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }
  tags = {
    Name = "2h9942-rtb-public"
  }
}
resource "aws_route_table" "private-1a" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "2h9942-rtb-private1-ap-northeast-1a"
  }
}
resource "aws_route_table" "private-1c" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "2h9942-rtb-private2-ap-northeast-1c"
  }
}
resource "aws_route_table" "private-1d" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "2h9942-rtb-private3-ap-northeast-1d"
  }
}

resource "aws_route_table_association" "public-1a" {
  subnet_id      = aws_subnet.public-1a.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-1c" {
  subnet_id      = aws_subnet.public-1c.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "public-1d" {
  subnet_id      = aws_subnet.public-1d.id
  route_table_id = aws_route_table.public.id
}
resource "aws_route_table_association" "private-1a" {
  subnet_id      = aws_subnet.private-1a.id
  route_table_id = aws_route_table.private-1a.id
}
resource "aws_route_table_association" "private-1c" {
  subnet_id      = aws_subnet.private-1c.id
  route_table_id = aws_route_table.private-1c.id
}
resource "aws_route_table_association" "private-1d" {
  subnet_id      = aws_subnet.private-1d.id
  route_table_id = aws_route_table.private-1d.id
}