resource "local_file" "inventory-file" { #this will create a file in local. 
  filename = "ansible-Hosts"
  content = templatefile("inventory.tpl", {           #Syntax tplfile will be created in local ansible-hosts
    slave1-ip = aws_instance.Ansible_Slave1.public_ip # public ip will be created 
    slave2-ip = aws_instance.Ansible_Slave2.public_ip
  })
}

