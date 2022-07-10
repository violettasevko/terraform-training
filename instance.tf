resource "aws_instance" "instance" {
  ami = "ami-0fbd1ecdaa0af2276"
  instance_type = "t4g.micro"
  key_name = "violetta"
  vpc_security_group_ids = [var.security_group]
  iam_instance_profile = var.instance_profile
}

resource "aws_eip" "public_ip" {
  instance = aws_instance.instance.id
}

resource "aws_ebs_volume" "storage" {
    availability_zone = aws_instance.instance.availability_zone
    size = "10"
    type = "gp3"
}

resource "aws_volume_attachment" "storage" {
  device_name = "/dev/sds"
  instance_id = aws_instance.instance.id
  volume_id = aws_ebs_volume.storage.id
}