resource "aws_subnet" "public-1a" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "ap-northeast-1a"
  cidr_block = "10.0.0.0/20"
  tags = {
    Name = "2h9942-subnet-public1-ap-northeast-1a"
  }
}
resource "aws_subnet" "public-1c" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "ap-northeast-1c"
  cidr_block = "10.0.16.0/20"
  tags = {
    Name = "2h9942-subnet-public2-ap-northeast-1c"
  }
}
resource "aws_subnet" "public-1d" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "ap-northeast-1d"
  cidr_block = "10.0.32.0/20"
  tags = {
    Name = "2h9942-subnet-public3-ap-northeast-1d"
  }
}
resource "aws_subnet" "private-1a" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "ap-northeast-1a"
  cidr_block = "10.0.128.0/20"
  tags = {
    Name = "2h9942-subnet-private1-ap-northeast-1a"
  }
}
resource "aws_subnet" "private-1c" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "ap-northeast-1c"
  cidr_block = "10.0.144.0/20"
  tags = {
    Name = "2h9942-subnet-private2-ap-northeast-1c"
  }
}
resource "aws_subnet" "private-1d" {
  vpc_id     = aws_vpc.main.id
  availability_zone = "ap-northeast-1d"
  cidr_block = "10.0.160.0/20"
  tags = {
    Name = "2h9942-subnet-private3-ap-northeast-1d"
  }
}