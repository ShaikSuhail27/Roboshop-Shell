#!/bin/bash

SERVER_NAMES=("MongoDB" "Redis" "MYSQL" "RabbitMQ" "Catalogue" "User" "Cart" "Shipping" "Payment" "dispatch" "Web")
INSTANCE_TYPE=""
IMAGE_ID="ami-03265a0778a880afb"
SECURITY_GID="sg-05fe3b7791764948d"

for i in "${SERVER_NAMES[@]}"
do
# if  it is Mongodb or Mysql then need to create t3.medium or else t2.micro
if [[ $i == "MongoDB" || $i == "MYSQL" ]]
then
INSTANCE_TYPE="t3.medium"
else
INSTANCE_TYPE="t2.micro"
fi
echo "Creating the $i Instance"
IP_ADDRESS=$(aws ec2 run-instances --image-id $IMAGE_ID --instance-type $INSTANCE_TYPE --security-group-ids $SECURITY_GID "ResourceType=instance,Tags=[{Key=Name,Value=$i}]" | jq -r '.Instances[0].PrivateIpAddress')
echo "Created the $i Instance" :$IP_ADDRESS
done