provider "aws" {
  shared_config_files      = ["C:/Users/V.Chudnov/.aws/config"]
  shared_credentials_files = ["C:/Users/V.Chudnov/.aws/credentials"]
}

resource "aws_instance" "Ubuntu20_04LTS" {
  ami             = "ami-0c9354388bb36c088"
  instance_type   = "t2.micro"
  key_name        = "slava-key-Frankfurt"
  security_groups = ["MySec-SSH-HTTP-HTTPS"]

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name    = "dev_server"
    Owner   = "Vyacheslav Chudnov"
    Project = "Final Project"
  }
}

resource "aws_instance" "AWS_Linux_5_10" {
  ami             = "ami-0a1ee2fb28fe05df3"
  instance_type   = "t2.micro"
  key_name        = "slava-key-Frankfurt"
  security_groups = ["MySec-SSH-HTTP-HTTPS"]

  root_block_device {
    volume_size = 20
  }

  tags = {
    Name    = "prod_server"
    Owner   = "Vyacheslav Chudnov"
    Project = "Final Project"
  }
}