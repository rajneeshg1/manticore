resource "digitalocean_ssh_key" "mcore" {
  name       = "${var.user_tag} Terraform Manticore Key"
  public_key = "${file(var.pub_key)}"
}

resource "digitalocean_tag" "env_tag" {
  name = "Environment:Manticore"
}

resource "digitalocean_tag" "user_tag" {
  name = "${var.user_tag}"
}

resource "digitalocean_droplet" "main" {

  name      = "${var.box_name}"
  image     = "${var.image}"
  size      = "${var.size}"
  region    = "${var.region}"
  private_networking = true
  tags      = ["${digitalocean_tag.env_tag.id}", "${digitalocean_tag.user_tag.id}"]


  ssh_keys = ["${digitalocean_ssh_key.mcore.fingerprint}"]

  connection {
      user = "root"
      type = "ssh"
      private_key = "${file(var.pvt_key)}"
      timeout = "2m"
      agent = false
  }

  provisioner "remote-exec" {
    inline = [
      "export PATH=$PATH:/usr/bin",
      "sudo apt-get update && sudo apt-get install python3 python3-pip -y",
      "sudo pip3 install manticore[native]",
      "cd /tmp; git clone https://github.com/trailofbits/manticore.git"
    ]
  }
}
