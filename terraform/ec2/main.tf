resource "aws_ami_from_instance" "ami" {
  name               = "source-ec2-instance-ami"
  source_instance_id = data.aws_instance.ec2.instance_id
  provider = aws.training
}

resource "aws_ami_launch_permission" "ami_premission" {
  image_id   = aws_ami_from_instance.ami.id
  account_id = "148482153770"
  provider = aws.training
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "single-instance"

  ami = aws_ami_launch_permission.ami_premission.image_id
  private_ip = "10.0.20.1"
  associate_public_ip_address = true
  instance_type          = "t2.micro"
  key_name               = "user1"
  monitoring             = true
  vpc_security_group_ids = ["sg-12345678"]
  subnet_id              = "subnet-eddcdzz4"

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}