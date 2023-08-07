data "aws_instance" "foo" {
  instance_id = "i-0fb8b8bae438e0a2f"
  provider    = aws.training
}