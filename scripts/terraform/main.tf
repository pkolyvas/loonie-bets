resource "aws_instance" "loonie_bets" {
  ami                     = var.packer-loonie
  instance_type           = t3.micro
  subnet_id               = module.loonie-bets-vpc.public_subnets.0
  disable_api_termination = true
  key_name                = [todo]
}

resource "aws_eip" "loonie_bets" {
  vpc = true
}

resource "aws_eip_association" "loonie_bets" {
  instance_id   = aws_instance.loonie_bets.id
  allocation_id = aws_eip.loonie_bets.id
}