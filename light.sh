#!/bin/bash

# Generate a random name for the second instance
random_name=$(uuidgen | cut -c1-8)

# Create the first instance in us-east-2 (Ohio)
aws lightsail create-instances \
    --instance-names "MyInstance1" \
    --availability-zone us-east-2a \
    --blueprint-id windows_server_2019 \
    --bundle-id "xlarge_win_3_0" \
    --region us-east-2

# Check for CreateInstance errors:
if [ $? -ne 0 ]; then
  exit 1
fi

# Create the second instance in us-west-2 (Oregon)
aws lightsail create-instances \
    --instance-names "MyInstance2" \
    --availability-zone us-west-2a \
    --blueprint-id windows_server_2019 \
    --bundle-id "xlarge_win_3_0" \
    --region us-west-2

# Check for CreateInstance errors again:
if [ $? -ne 0 ]; then
  exit 1
fi
