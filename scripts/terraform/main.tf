resource "aws_instance" "loonie_bets" {

}

resource "aws_eip" "loonie_bets" {

}

resource "aws_eip_association" "loonie_bets" {
  instance_id = aws_instance.loonie_bets.id
}