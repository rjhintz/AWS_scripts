#!/usr/bin/env bash

# Describe AWS Instances
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS default region= " $AWS_DEFAULT_REGION
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
instance_count=${#instances[*]}
# because the compound command (( )) is part of the shell syntax
# rather than an ordinary command, and it deals only with integers,
# it is able to recognize variables by name and does not require expansion to be performed
if (( instance_count == 0)); then
    echo "No running instances"
    exit
fi
# echo "Instance count" $instance_count
#
# List instances
index=0
while [ $index -lt $instance_count ]
do
    echo ${instances[$index]}
    # arithmetic evaluation syntax: ((x))
    ((index++))
done;
