#!/bin/bash

# Execute the first command and store the output
output1=$(aws lightsail get-instance-access-details --region us-west-2 --instance-name MyInstance2)

# Execute the second command and store the output
output2=$(aws lightsail get-instance-access-details --region us-east-2 --instance-name MyInstance1)

# Parse the output and extract the required details
ip1=$(echo "$output1" | jq -r '.accessDetails.ipAddress')
user1=$(echo "$output1" | jq -r '.accessDetails.username')
pass1=$(echo "$output1" | jq -r '.accessDetails.password')

ip2=$(echo "$output2" | jq -r '.accessDetails.ipAddress')
user2=$(echo "$output2" | jq -r '.accessDetails.username')
pass2=$(echo "$output2" | jq -r '.accessDetails.password')

# Print the credentials in the specified format
echo "$ip1:$user1:$pass1"
echo "$ip2:$user2:$pass2"
