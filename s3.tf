resource "aws_s3_bucket" "main" {
    bucket = "2h9942-main"
    tags = {
      Name = "2h9942-main"
    }
}