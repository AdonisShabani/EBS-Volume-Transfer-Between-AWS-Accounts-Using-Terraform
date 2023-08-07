resource "aws_ebs_snapshot" "snapshot" {
  for_each  = data.aws_ebs_volumes.example.ids
  volume_id = each.key
  provider  = aws.training
}