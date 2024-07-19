resource "aws_instance" "Ansible_Master" {
  ami                         = "ami-09040d770ffe2224f"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.Ansible_subnet.id
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.allow_all_traffic.id}"]
  user_data                   = base64encode(file("userdata.sh"))
  key_name                    = "us-east-2"

  provisioner "file" {
    source      = "./ansible-Hosts"    # path to the local file in the current folder
    destination = "/home/ubuntu/hosts" # destination path on the EC2 instance & can give any file name

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("us-east-2.pem") # path to your private key file or we can give pem file path also.
      host        = aws_instance.Ansible_Master.public_ip
    }
  }

  tags = {
    Name = "Ansible-master"
  }

  depends_on = [
    aws_instance.Ansible_Slave1,
    aws_instance.Ansible_Slave2,
    local_file.inventory-file
  ]
}


resource "aws_instance" "Ansible_Slave1" {
  ami                         = "ami-09040d770ffe2224f"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.Ansible_subnet2.id
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.allow_all_traffic.id}"]

  key_name = "us-east-2"

  tags = {
    Name = "Ansible-Node-1"
  }
}


resource "aws_instance" "Ansible_Slave2" {
  ami                         = "ami-09040d770ffe2224f"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.Ansible_subnet2.id
  associate_public_ip_address = true
  vpc_security_group_ids      = ["${aws_security_group.allow_all_traffic.id}"]

  key_name = "us-east-2"

  tags = {
    Name = "Ansible-Node-2"
  }
}

