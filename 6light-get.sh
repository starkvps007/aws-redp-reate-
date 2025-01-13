#!/bin/bash

# Function to retrieve access details
get_credentials() {
    local region=$1
    local instance_name=$2

    output=$(aws lightsail get-instance-access-details --region "$region" --instance-name "$instance_name")

    ip=$(echo "$output" | jq -r '.accessDetails.ipAddress')
    user=$(echo "$output" | jq -r '.accessDetails.username')
    pass=$(echo "$output" | jq -r '.accessDetails.password')

    echo "$ip:$user:$pass"
}

# Retrieve credentials for each instance
get_credentials "us-east-2" "MyInstance1"
get_credentials "us-west-2" "MyInstance2"
get_credentials "eu-west-2" "MyInstance3"
get_credentials "eu-west-3" "MyInstance4"
get_credentials "eu-central-1" "MyInstance5"
get_credentials "ca-central-1" "MyInstance6"
