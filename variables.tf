# Azure GUIDS
variable "subscription_id" {}
variable "client_id" {}
variable "client_secret" {}
variable "tenant_id" {}

variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
}

#Location
variable "location" {
  description = "The Azure Regsion in which all resources in this example should be created."
}

# Network
variable "address_space" {
  description = "the address space to be used"
}

variable "address_prefix_main" {
  description = "the address prefix to be used"
}

#image_id
variable "packer_image_id" {
  description = "The image id for the packer custom image"
}

#VirtualMachineCount
variable "vm_count" {
  description = "The no of VMs we want in our infra"
}
