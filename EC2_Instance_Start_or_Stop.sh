#!/bin/bash

# Set the variables for the AWS profile and the instance ID
PROFILE="your_aws_profile"
INSTANCE_ID="your_instance_id"

# Check the current status of the instance
status=$(aws --profile $PROFILE ec2 describe-instances --instance-ids $INSTANCE_ID --query "Reservations[*].Instances[*].State.Name" --output text)

# Start or stop the instance based on the current status
if [ "$status" == "stopped" ]; then
    aws --profile $PROFILE ec2 start-instances --instance-ids $INSTANCE_ID
    echo "Starting instance: $INSTANCE_ID"
elif [ "$status" == "running" ]; then
    aws --profile $PROFILE ec2 stop-instances --instance-ids $INSTANCE_ID
    echo "Stopping instance: $INSTANCE_ID"
else
    echo "Instance $INSTANCE_ID is in $status state"
fi
