#!/usr/bin/env bash
#
#
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
index=0
# How many are there?
az_count=${#az[*]}
# adjust values when an AZ can't create subnets
az_spread=4
index_az=2
#
# number of subnets per AZ
subnet_spread=3
#
index_subnets=0
#
echo "Creating subnets in VPC " $vpc
while [ $index_az -lt $az_spread ]
do
    while [ $index_subnets -lt $subnet_spread ]
    do
        < commands >
#
        if egrep --quiet  '("pending")|("available")' create_subnet.json
        then
            # code if found
            echo "subnet ok; pending or available"
        else
            # code if not found
            echo ""
            echo "error creating subnet. Exiting"
            exit
        fi
        aws ec2 wait subnet-available
        ((index_subnets++))
    done;
# 2nd pass for 2nd AZ
index_subnets=0 # reset inner loop index
cidr_subnets=(172.16.{11..13}.0/24)
((index_az++))
done;
# END
