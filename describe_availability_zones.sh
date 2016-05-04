#!/usr/bin/env bash

# Describe AWS AZs
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
# Put the AZs into an array
az=($(aws ec2 describe-availability-zones --output text | cut -f 4))
# curly braces are required when expanding arrays
# http://stackoverflow.com/questions/8748831/when-do-we-need-curly-braces-in-variables-using-bash
# echo ${az[*]}
#
echo "AZs "
# How many are there?
az_count=${#az[*]}
echo "AZ count" $az_count
#
# List AZs
index=0
while [ $index -lt $az_count ]
do
    echo ${az[$index]}
    # arithmetic evaluation syntax: ((x))
    ((index++))
done;
