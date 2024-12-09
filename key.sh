aws ec2 create-key-pair --key-name test --query 'KeyMaterial' --output text > test.pem
chmod 400 test.pem
