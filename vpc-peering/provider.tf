# Configure the AWS Provider for vpc1
provider "aws" {
  region = "us-east-2"
}

# Configure the AWS Provider for vpc2
provider "aws" {
  alias = "uat"
  region = "us-west-2"
}

