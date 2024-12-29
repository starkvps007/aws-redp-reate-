#!/bin/bash

# Check if any EC2 instances are running
instances=$(aws ec2 describe-instances --query 'Reservations[].Instances[].InstanceId' --output text)

# If instances are found, terminate them
if [ -n "$instances" ]; then
  echo "Terminating EC2 instances: $instances"
  aws ec2 terminate-instances --instance-ids "$instances"
  # Wait for instances to terminate (with timeout)
  aws ec2 wait instance-terminated --instance-ids "$instances" --timeout 60
fi

echo "EC2 instance check and termination complete."

# Exit script after completion
exit 0
