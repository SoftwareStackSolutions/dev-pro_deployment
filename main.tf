# main.tf code has been changed
terraform {
  required_version = ">= 1.9.8"
}

# testing the demo block
resource "terraform_data" "demo" {
  input = "Hello Dev Pipeline"
}

# display the output
output "message" {
  value = terraform_data.demo.output
}
