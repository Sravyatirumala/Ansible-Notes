#! /bin/bash
sudo apt update
sudo apt install ansible -y





# ---
# - name: Install nginx
#   hosts: all
#   become: yes
#   tasks:
#    - name: Install nginx
#      shell: "apt update && apt install nginx -y"
#    - name: "Start and enable nginx"
#      shell: "systemctl enable nginx && systemctl start nginx"