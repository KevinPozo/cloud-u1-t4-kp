provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "windows_security_group_kp" {
  name        = "windows-security-group-kp"
  description = "Security group para Windows con RDP"

  ingress {
    from_port   = 3389
    to_port     = 3389
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "instancia_windows_kp" {
  ami                    = "ami-0b5f645abc199e666"
  instance_type          = "t3.micro"
  key_name               = "mi-segunda-llaves"
  vpc_security_group_ids = [aws_security_group.windows_security_group_kp.id]

  tags = {
    Name = "MiInstanciaWindowsTerraform"
  }
}