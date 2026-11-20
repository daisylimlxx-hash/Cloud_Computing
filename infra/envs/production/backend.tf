# Production environment. Same state bucket + lock table as sandbox, but a
# different "key", so production's state file never touches sandbox's.
terraform {
  backend "s3" {
    bucket         = "assignment-library-243710467576"
    key            = "production/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "library-tf-lock"
    encrypt        = true
  }
}
