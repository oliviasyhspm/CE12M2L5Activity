terraform {
  # Backend block to store tfstate in the specified directory
  backend "local" {
    path = "CE12M2L5Activity/terraform.tfstate"
  }
}

provider "aws" {
  region = "ap-southeast-1" # Replace with your preferred region
}

resource "aws_dynamodb_table" "book_inventory" {
  name           = "osy-bookinventory"
  billing_mode   = "PAY_PER_REQUEST" # Default serverless billing
  hash_key       = "ISBN"
  range_key      = "Genre"

  # Attribute definitions for Partition and Sort keys
  attribute {
    name = "ISBN"
    type = "S" # String
  }

  attribute {
    name = "Genre"
    type = "S" # String
  }

  tags = {
    Name = "osy-bookinventory"
  }
}
