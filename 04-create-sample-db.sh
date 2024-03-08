aws rds describe-db-instances --db-instance-identifier mydbinstance --query 'DBInstances[*].Endpoint.Address'

mysql -h my-database-instance.abcdefgh1234.us-east-1.rds.amazonaws.com -P 3306 -u <username> -p



mysql -h mydbinstance.cntljutp5qa8.ap-southeast-2.rds.amazonaws.com -P 3306 -u mymasteruser -p mymasterpwd
