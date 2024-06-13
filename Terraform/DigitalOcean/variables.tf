###########
# SSH Key #
###########
data "digitalocean_ssh_key" "terraform" {
    name = "SSH_KEY_NAME"
}
variable "pvt_key" {
    type        = string
    description = "The path to your private SSH key"
    default     = "~/.ssh/id_rsa"
}
variable "pub_key" {
    type        = string
    description = "The path to your public SSH key"
    default     = "~/.ssh/id_rsa.pub"
}
################
# DigitalOcean Variables #
################
variable "do_token" {
    type        = string
    description = "DigitalOcean API token"
    default     = "API_TOKEN"
}
variable "region" {
    type    = string
    default = "nyc1"
}
variable "size" {
    type = string
    default = "s-1vcpu-1gb"
}
variable "image" {
    type = string
    default = "ubuntu-20-04-x64"
}
variable "tag" {
    type = string
    default = "test"
}
variable "count" {
    type = number
    default = 1
}
