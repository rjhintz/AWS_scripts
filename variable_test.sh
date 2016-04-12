#!/bin/bash

# Test variable substitution
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
az_spread=2
subnet_spread=3
#
echo "az_spread" $az_spread
echo "subnet_spread " $subnet_spread
#
index_az=0
index_subnets=0
# create-subnet
# [--dry-run | --no-dry-run]
# --vpc-id <value>
# --cidr-block <value>
# [--availability-zone <value>]
# Braces expand to 01, 02, 03, 11, 12, 13
cidr0=(172.16.{0..1}{1..3}.0.0/24)
#
echo " "
echo ${cidr0[*]}
#
echo "availability-zone " ${az[0]}
echo "cidr-block " ${cidr0[0]}
