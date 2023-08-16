resource "aws_ami_from_instance" "ami" {
  for_each = { for k, v in local.instance_configuration : k => v }
  name               = "source-ec2-instance-ami"
  source_instance_id = each.value.id
  provider = aws.training
}

resource "aws_ami_launch_permission" "ami_premission" {
  for_each = aws_ami_from_instance.ami
  image_id   = each.key
  account_id = "148482153770"
  provider = aws.training
}

module "ec2_instance_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.16.2"

  name        = "my-sg"
  description = "EC2 Security Group"
  vpc_id      = data.terraform_remote_state.networking.outputs.vpc_id

  # ingress with source sg
  ingress_with_cidr_blocks = [
    {
      description              = "Allow incoming HTTP traffic"
      from_port                = 80
      to_port                  = 80
      protocol                 = "tcp"
      cidr_blocks = "0.0.0.0/0"
    },
    {
      description              = "Allow incoming SSH traffic"
      from_port                = 22
      to_port                  = 22
      protocol                 = "tcp"
      cidr_blocks = "0.0.0.0/0"
    }

  ]
  
  # egress
  egress_with_cidr_blocks = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = "0.0.0.0/0"
    },
  ]

}
module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "ec2-destination-instance"

  ami = aws_ami_from_instance.ami.id
  associate_public_ip_address = true
  instance_type          = "t3.micro"
  key_name               = "destination-key"
  vpc_security_group_ids = [module.ec2_instance_sg.security_group_id]
  subnet_id              = element(data.terraform_remote_state.networking.outputs.public_subnets, 1)
  private_ip = "10.0.11.5"

  tags = {
    Environment = "dev"
  }
}