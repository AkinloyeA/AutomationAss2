resource "null_resource" "linux_provisioner" {
  count = var.vm_count

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y update",
      "sudo yum install -y python3-pip",
      "sudo pip3 install --upgrade pip",
      "sudo pip3 install ansible"
    ]

    connection {
      type        = "ssh"
      user        = var.admin_username
      private_key = file(var.private_key)
      host        = azurerm_linux_virtual_machine.vm[count.index].public_ip_address
    }
  }

    provisioner "local-exec" {
    command = "ssh-keyscan ${azurerm_linux_virtual_machine.vm[count.index].public_ip_address} >> ~/.ssh/known_hosts"
  }
    provisioner "local-exec" {  
    command = "ansible-playbook -i '${azurerm_linux_virtual_machine.vm[count.index].public_ip_address},' -u ${var.admin_username} --private-key=${var.private_key} /mnt/c/Users/aaare/automation/ansible/assignment2/groupX-playbook.yml"
    }
}
  
