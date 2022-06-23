# We expect this variable to be set by a TF_VAR environment variable derived from the packer AMI, but a datasource is
# probably a better way to go and eventually how we'd do it.
variable "packer-loonie" {
  type        = string
  description = "The AMI used for our EC2 instance"
}