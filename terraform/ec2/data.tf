data "aws_instance" "foo" {
  instance_id = "i-0fb8b8bae438e0a2f"
  provider    = aws.training
}

data "aws_ebs_volumes" "example" {
  tags = {
    name = "source-volumes"
  }
  provider = aws.training
}

data "aws_ebs_volume" "ebs_volume" {
  for_each    = data.aws_ebs_volumes.example.ids
  most_recent = true

  filter {
    name   = "source-volume-1"
    values = [each.value]
  }

  filter {
    name   = "source-volume-2"
    values = [each.value]
  }
  provider = aws.training
}