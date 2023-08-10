data "aws_instance" "ec2" {
  instance_id = "i-0739a8644a96b6110"
  provider    = aws.training
}