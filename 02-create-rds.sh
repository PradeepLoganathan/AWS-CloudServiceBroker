export AWS_DEFAULT_REGION="ap-southeast-2"

aws rds create-db-instance \
    --db-instance-identifier mydbinstance \
    --db-instance-class db.t2.micro \
    --engine mysql \
    --allocated-storage 20 \
    --master-username mymasteruser \
    --master-user-password mymasterpwd \
    --tags Key=Name,Value=mydbinstance


aws rds modify-db-instance \
    --db-instance-identifier mydbinstance \
    --publicly-accessible

aws rds describe-db-instances \
    --db-instance-identifier mydbinstance  \
    --query 'DBInstances[].VpcSecurityGroups[].VpcSecurityGroupId' #sg-0fa841426ea389446

aws ec2 authorize-security-group-ingress \
    --group-id  sg-0fa841426ea389446\
    --protocol tcp \
    --port 3306 \
    --cidr 0.0.0.0/0  # Use 0.0.0.0/0 for 'Anywhere' or your specific IP/range
