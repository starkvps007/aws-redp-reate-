#!/bin/bash

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

# Create the third instance in eu-west-2 (London)
aws lightsail create-instances \
    --instance-names "MyInstance3" \
    --availability-zone eu-west-2a \
    --blueprint-id windows_server_2019 \
    --bundle-id "xlarge_win_3_0" \
    --region eu-west-2

# Check for CreateInstance errors:
if [ $? -ne 0 ]; then
  exit 1
fi

# Create the fourth instance in eu-west-3 (Paris)
aws lightsail create-instances \
    --instance-names "MyInstance4" \
    --availability-zone eu-west-3a \
    --blueprint-id windows_server_2019 \
    --bundle-id "xlarge_win_3_0" \
    --region eu-west-3

# Check for CreateInstance errors:
if [ $? -ne 0 ]; then
  exit 1
fi

# Create the fifth instance in eu-central-1 (Frankfurt)
aws lightsail create-instances \
    --instance-names "MyInstance5" \
    --availability-zone eu-central-1a \
    --blueprint-id windows_server_2019 \
    --bundle-id "xlarge_win_3_0" \
    --region eu-central-1

# Check for CreateInstance errors:
if [ $? -ne 0 ]; then
  exit 1
fi

# Create the sixth instance in ca-central-1 (canada)
aws lightsail create-instances \
    --instance-names "MyInstance6" \
    --availability-zone ca-central-1a \
    --blueprint-id windows_server_2019 \
    --bundle-id "xlarge_win_3_0" \
    --region ca-central-1

# Check for CreateInstance errors:
if [ $? -ne 0 ]; then
  exit 1
fi
