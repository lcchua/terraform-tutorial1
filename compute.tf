# This code block allows us to create an ec2 instance with hardcoded values
resource "aws_instance" "sample_ec2_hardcoded" {
  ami           = "ami-0b72821e2f351e396"
  instance_type = "t2.micro"
  key_name      = "lcchua-useast1-20072024" # change to your own keypair name
  subnet_id     = "subnet-0b3f026e9d6288a67" # change to your own vpc subnet id
  associate_public_ip_address = tr
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "lcchua-webserver-terraform"
  }
}

# This code block allows us to create an ec2 instance with the use of variables
# To overwrite any one particular variable, we can pass the variable at runtime during terraform apply step
# e.g. terraform apply --var ec2_name="my-webserver"
resource "aws_instance" "sample_ec2_variables" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = data.aws_subnet.selected_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = var.ec2_name
  }
}
