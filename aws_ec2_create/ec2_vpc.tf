provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "terraform_key" {
  key_name   = "terra_key"
  public_key = file("~/.ssh/terra_key.pub")
}

resource "aws_instance" "vpc_instance" {
  key_name        = "aws_key-pair.terraform_key.key_name"
  ami             = var.ec2-ubuntu-ami
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow-ssh.name]
}

resource "aws_default_vpc" "default_vpc" {

}

resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "allow ssh inbound trafic "
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description = "TLS from vpc"

    from_port = 22
    to_port   = 22
    protocol  = "TCP"

    cidr_blocks = ["0.0.0.0/0"]

    tags = {
      name = "allow-ssh"
    }

  }
}


####################################################################
#running file 


#resource "aws_key_pair" "terraform_key" {
# key_name = "terra_key"
#public_key = file("home/ubuntu/.ssh/terra_key.pub")
#}



resource "aws_instance" "vpc_instance" {
  # key_name = aws_key_pair.terraform_key.key_name
  ami             = var.ec2-ubuntu-ami
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.allow-ssh.name]
}


resource "aws_default_vpc" "default_vpc" {

}


resource "aws_security_group" "allow-ssh" {
  name        = "allow-ssh"
  description = "allow ssh inbound trafic "
  vpc_id      = aws_default_vpc.default_vpc.id

  ingress {
    description = "TLS from vpc"

    from_port = 22
    to_port   = 22
    protocol  = "TCP"

    cidr_blocks = ["0.0.0.0/0"]

  }
}
