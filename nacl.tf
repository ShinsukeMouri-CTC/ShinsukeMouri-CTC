resource "aws_default_network_acl" "acl" {
  default_network_acl_id = aws_vpc.main.default_network_acl_id
  subnet_ids = [
    aws_subnet.public-1a.id, aws_subnet.public-1c.id, aws_subnet.public-1d.id,
    aws_subnet.private-1a.id, aws_subnet.private-1c.id, aws_subnet.private-1d.id
  ]
  ingress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  egress {
    protocol   = -1
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 0
    to_port    = 0
  }
  tags = {
    Name = "2h9942-vpc-defalut-nacl"
  }
}