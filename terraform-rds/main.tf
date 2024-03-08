provider "aws" {
  region = "ap-southeast-2" # Use your AWS region
}

resource "aws_db_instance" "my_rds_instance" {
  identifier        = "mydbinstance"
  allocated_storage = 80
  engine            = "mysql"
  engine_version    = "8.0.35"
  instance_class    = "db.t3.micro"
  username          = "mymasteruser"
  password          = "mymasterpwd"
  publicly_accessible = "true"
  apply_immediately     = true  # Be cautious; this can cause downtime
}

