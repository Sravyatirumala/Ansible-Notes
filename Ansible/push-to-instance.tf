resource "null_resource" "pushfile3" {
  provisioner "file" {
    source      = "./Instance.tf"              # path to the local file in the current folder
    destination = "/home/ubuntu/instance/file" # destination path on the EC2 instance & can give any file name

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("us-east-2.pem") # path to your private key file or we can give pem file path also.
      host        = aws_instance.Ansible_Master.public_ip
    }
  }
  depends_on = [
    null_resource.create_folder
  ]
}


# resource "null_resource" "create_folder" {
#   provisioner "remote-exec" {
#     inline = [
#       "cd /home/ubuntu/",
#       "sudo mkdir instance",
#       "sudo chown ubuntu instance"
#     ]

#     connection {
#       type        = "ssh"
#       user        = "ubuntu"
#       private_key = file("us-east-2.pem") // Replace with your actual path
#       host        = aws_instance.Ansible_Master.public_ip
#     }
#   }

# }




