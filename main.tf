#demo codes for testing
terraform {
  required_version = ">= 1.9.8"
}

resource "terraform_data" "demo" {
  input = "Hello Dev Pipeline"
}

output "message" {
  value = terraform_data.demo.output
}
