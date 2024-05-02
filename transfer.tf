resource "aws_transfer_server" "main" {
  endpoint_type = "VPC"
  endpoint_details {
    subnet_ids             = ["${aws_subnet.private-1a.id}","${aws_subnet.private-1c.id}","${aws_subnet.private-1d.id}"]
    vpc_id                 = aws_vpc.main.id
  }
  protocols = ["SFTP"]
  tags = {
    Name = "2h9942-transfer-server"
  }
}