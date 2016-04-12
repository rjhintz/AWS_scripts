#!/bin/bash

# Describe AWS AZs
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
# Put the AZs into an array
az=($(aws ec2 describe-availability-zones --output text | cut -f 4))
#
index=0
# How many are there?
az_count=${#az[*]}
# echo "AZ count " $az_count
#
# List AZs
while [ $index -lt $az_count ]
do
#   echo ${az[$index]}
    # arithmetic evaluation syntax ((x))
    ((index++))
done;
