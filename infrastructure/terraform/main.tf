provider "aws" {
  region = "us-gov-west-1a"
}

terraform {
  backend "s3" {
    bucket = "rackner-test-k8s-cluster"
    key    = "dev/terraform"
    region = "us-gov-west-1a"
  }
}

locals {
  azs                     = ["us-gov-west-1a", "us-gov-west-1b", "us-gov-west-1c"]
  environment             = "staging"
  kops_state_bucket_name  = "${local.environment}-kops-state"
  kubernetes_cluster_name = "test-k8s-cluster.rackner.com"
  ingress_ips             = ["10.0.0.100/32", "10.0.0.101/32"]
  vpc_name                = "${local.environment}-vpc"

  tags = {
    environment = "${local.environment}"
    terraform   = true
  }
}

data "aws_region" "current" {}