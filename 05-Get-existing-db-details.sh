#!/bin/bash

# Replace this with your RDS instance identifier
INSTANCE_IDENTIFIER="mydbinstance"

# Fetch the RDS instance details
aws rds describe-db-instances --db-instance-identifier $INSTANCE_IDENTIFIER --query 'DBInstances[0]' > rds_details.json

# Parse and display specific fields from the JSON output
echo "RDS Instance Details:"
echo "Identifier: $(jq -r '.DBInstanceIdentifier' rds_details.json)"
echo "Allocated Storage: $(jq -r '.AllocatedStorage' rds_details.json) GB"
echo "Engine: $(jq -r '.Engine' rds_details.json)"
echo "Engine Version: $(jq -r '.EngineVersion' rds_details.json)"
echo "Instance Class: $(jq -r '.DBInstanceClass' rds_details.json)"
echo "DB Name: $(jq -r '.DBName' rds_details.json)"
echo "Master Username: $(jq -r '.MasterUsername' rds_details.json)"
echo "Parameter Group Name: $(jq -r '.DBParameterGroups[0].DBParameterGroupName' rds_details.json)"

# Note: Password is not retrievable via AWS CLI for security reasons.
