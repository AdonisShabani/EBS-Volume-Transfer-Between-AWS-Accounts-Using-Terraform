locals {
  project = "Training"

  instance_configuration = {
    ec2-first = {
    name = "ec2-first"
    id = "i-003f29498fb7380a6"
		private_ip = "10.0.12.5"
  },
    ec2-second = {
    name = "ec2-second"
    id = "i-017005515b14e34da"
		private_ip = "10.0.12.6"
	}
  }
}

