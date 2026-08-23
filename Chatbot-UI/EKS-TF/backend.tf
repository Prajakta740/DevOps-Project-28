terraform {
  backend "s3" {
    bucket         = "praj-chatbot-ai"
    region         = "ap-south-1"
    key            = "Chatbot-UI/EKS-TF/terraform.tfstate"
    use_lockfile   = true
  }
  required_version = ">=0.13.0"
  required_providers {
    aws = {
      version = ">= 6.0"
      source  = "hashicorp/aws"
    }
  }
}
