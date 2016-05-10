#!/usr/bin/env bash

# Describe AWS Instances
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
# Put the instances into an array
instances=($(aws ec2 describe-instances --output text)) # \
    # | cut -f 4))
# curly braces are required when expanding arrays
# http://stackoverflow.com/questions/8748831/when-do-we-need-curly-braces-in-variables-using-bash
# echo ${instance[*]}
#
# echo "instances "
# How many are there?
instance_count=${#instance[*]}
echo "Instance count" $instance_count
#
# List instances
index=0
while [ $index -lt $instance_count ]
do
    echo ${instance[$index]}
    # arithmetic evaluation syntax: ((x))
    ((index++))
done;
