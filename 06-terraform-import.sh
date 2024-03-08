# initialize terraform. This creates the state file
terraform init

#now import the existing database into terraform state so that terraform is aware of it
terraform import aws_db_instance.my_rds_instance mydbinstance

# aws_db_instance.my_rds_instance: Import prepared!
#   Prepared aws_db_instance for import
# aws_db_instance.my_rds_instance: Refreshing state... [id=mydbinstance]

# Import successful!

# The resources that were imported are shown above. These resources are now in
# your Terraform state and will henceforth be managed by Terraform.

#===================================================================================================================================================================================================

#in this step i will change the allocated storage from 20 to 40 and call terraform plan so that
#terraform can identify the changes needed and then call terraform apply

terraform plan

# aws_db_instance.my_rds_instance: Refreshing state... [id=db-JX7BH4FIE5F5E7INLTU67U62FA]

# Terraform used the selected providers to generate the following execution plan. Resource actions are indicated with the following symbols:
#   ~ update in-place

# Terraform will perform the following actions:

#   # aws_db_instance.my_rds_instance will be updated in-place
#   ~ resource "aws_db_instance" "my_rds_instance" {
#       ~ allocated_storage                     = 20 -> 40
#       + apply_immediately                     = false
#         id                                    = "db-JX7BH4FIE5F5E7INLTU67U62FA"
#       + password                              = (sensitive value)
#       ~ publicly_accessible                   = true -> false
#       ~ skip_final_snapshot                   = true -> false
#       ~ tags                                  = {
#           - "Name" = "mydbinstance" -> null
#         }
#       ~ tags_all                              = {
#           - "Name" = "mydbinstance"
#         } -> (known after apply)
#         # (46 unchanged attributes hidden)
#     }

# Plan: 0 to add, 1 to change, 0 to destroy.

# ─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────

# Note: You didn't use the -out option to save this plan, so Terraform can't guarantee to take exactly these actions if you run "terraform apply" now.

#===================================================================================================================================================================================================

terraform apply

# Terraform will perform the following actions:

#   # aws_db_instance.my_rds_instance will be updated in-place
#   ~ resource "aws_db_instance" "my_rds_instance" {
#       ~ allocated_storage                     = 20 -> 40
#       + apply_immediately                     = false
#         id                                    = "db-JX7BH4FIE5F5E7INLTU67U62FA"
#       + password                              = (sensitive value)
#       ~ skip_final_snapshot                   = true -> false
#       ~ tags                                  = {
#           - "Name" = "mydbinstance" -> null
#         }
#       ~ tags_all                              = {
#           - "Name" = "mydbinstance"
#         } -> (known after apply)
#         # (47 unchanged attributes hidden)
#     }

# Plan: 0 to add, 1 to change, 0 to destroy.

# Do you want to perform these actions?
#   Terraform will perform the actions described above.
#   Only 'yes' will be accepted to approve.

#   Enter a value: yes

# aws_db_instance.my_rds_instance: Modifying... [id=db-JX7BH4FIE5F5E7INLTU67U62FA]
# aws_db_instance.my_rds_instance: Still modifying... [id=db-JX7BH4FIE5F5E7INLTU67U62FA, 10s elapsed]
# aws_db_instance.my_rds_instance: Still modifying... [id=db-JX7BH4FIE5F5E7INLTU67U62FA, 20s elapsed]

#===========================================================================================================================
# once this is done aws rds describe-db-instances --db-instance-identifier $INSTANCE_IDENTIFIER  for INSTANCE_IDENTIFIER="mydbinstance" gives this

#    "PendingModifiedValues": {
#         "DBInstanceClass": "db.t3.micro",
#         "AllocatedStorage": 40
#     },
#     "LatestRestorableTime": "2024-03-05T05:20:00+00:00",
#     "MultiAZ": false,

# This data type is used as a response element in the ModifyDBInstance operation and contains changes that will be applied during the next maintenance window. https://docs.aws.amazon.com/AmazonRDS/latest/APIReference/API_PendingModifiedValues.html