#variable "do_token" {}
variable "pub_key" {}
variable "pvt_key" {}
variable "box_name" {}
variable "user_tag" {
  default = "manticore"
}

provider "digitalocean" {
  #token = "${var.do_token}"
}

variable "image" {
  default = "ubuntu-18-04-x64"
}

variable "size" {
  #default = "c-32"
  default = "s-1vcpu-2gb"
}

variable "region" {
  default = "nyc3"
}
