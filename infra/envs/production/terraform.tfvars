# Production environment: same infrastructure as sandbox, in its own VPC.
# name_prefix changes every resource name (production-vpc, production-alb,
# production-rds, ...) so nothing collides with the sandbox (testing) copy.
aws_region  = "us-east-1"
name_prefix = "production"

vpc_cidr                 = "10.1.0.0/16"
public_subnet_cidrs      = ["10.1.0.0/20", "10.1.16.0/20"]
private_app_subnet_cidrs = ["10.1.32.0/20", "10.1.48.0/20"]
private_db_subnet_cidrs  = ["10.1.64.0/20", "10.1.80.0/20"]

# Secret names are unique per account+region, and the uploads bucket is
# created by hand (Terraform does not manage it), so both need their own name.
secret_name    = "production-db-credentials"
s3_bucket_name = "production-s3-uploads"
