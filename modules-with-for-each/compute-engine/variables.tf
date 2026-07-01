# variable "vm_instance_name" {
#   description = "The name of the VM instance."
#   type        = string
# }

# variable "vm_instance_machine_type" {
#   description = "The machine type of the VM instance."
#   type        = string
# }

# variable "vm_instance_zone" {
#   description = "The zone of the VM instance."
#   type        = string
# }

# variable "service_account_email" {
#   description = "VM Service Account"
#   type        = string
# }

variable "vms" {
  type = map(object({
    vm_instance_name         = string
    vm_instance_machine_type = string
    vm_instance_zone         = string
    service_account_id       = string
  }))
}
