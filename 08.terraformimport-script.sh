#!/bin/bash

# Path to the JSON file containing RDS instance identifiers
RDS_JSON_FILE="rds_instances.json"

# Base command format for terraform import
IMPORT_CMD_FORMAT="terraform import module.rds_module.aws_db_instance.%s %s"

# Read each RDS instance ID from the JSON file
for RDS_ID in $(jq -r '.[].ID' "$RDS_JSON_FILE"); do
    
    TF_RESOURCE_NAME=$(echo "$RDS_ID" | sed 's/-/_/g')
        
    IMPORT_CMD=$(printf "$IMPORT_CMD_FORMAT" "$TF_RESOURCE_NAME" "$RDS_ID")
    
    # Print the import command (or execute it directly)
    echo "$IMPORT_CMD"
    
    # If you wish to execute the import command directly, uncomment the next line
    # eval $IMPORT_CMD
done
