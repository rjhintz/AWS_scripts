#!/bin/bash

# Create subject for an already created VPC
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
# Is there a VPC with CIDR 172.16.0.0/16?
default_cidr="172.16.0.0/16"
read -p "CIDR? (default: $default_cidr)  " cidr

# if $cidr value that's input has regex pattern ^$, it's empty, so use default
if [[ "$cidr" =~ ^$ ]]; then
      cidr=$default_cidr
      echo "using default CIDR $default_cidr";
fi
# ========================================================================
# Describe VPCs
# Describe VPC fields
# 1- "VPCS"
# 2- CidrBlock
# 3- DhcpOptionsId
# 4- InstanceTenancy
# 5- IsDefault
# 6- State
# 7- VpcId
#
# get VpcId from field 7
vpc=$(aws ec2 describe-vpcs --output text --filters Name=cidr,Values=$cidr | cut -f 7)
#
# if $vpc = regex ^$, then no VPC with specified CIDR
if [[ "$vpc" =~ ^$ ]]; then
      echo "No current VPC with CIDR $cidr"
      exit
fi
# =======================================================================
aws ec2 describe-subnets --output text   --filters Name=vpc-id,Values=$vpc | cut -f 8 >subnet
if [ "$subnet" ]; then
    echo ""
    aws ec2 describe-subnets --output table  --filters Name=vpc-id,Values=$vpc
else
    echo ""
    echo "No VPC subnets for CIDR $cidr"
fi
# =======================================================================
#
# Put the AZs into an array
az=($(aws ec2 describe-availability-zones --output text | cut -f 4))
#
index=0
# How many are there?
az_count=${#az[*]}
# echo "AZ count " $az_count
# List AZs
while [ $index -lt $az_count ]
do
#   echo ${az[$index]}
    # arithmetic evaluation syntax ((x))
    ((index++))
done;
#
# Create 6 subnets
# --create each as /24
# --spread evenly across 2 AZs
# --some AZs may not allow subnet creation
# aws ec2 create-subnet --vpc-id <value> \
#                       --cidr-block <value> \
#                       --availability-zone <value> \
#                       --dry-run | --no-dry-run
# aws ec2 create-subnet --vpc-id <value> \
#                       --cidr-block <value> \
#                       --availability-zone <value>
# aws ec2 wait subnet-available
#
# use --cli-input-json parameter after --generate-cli-skeleton
# aws ec2 run-instances --cli-input-json file://ec2runinst.json
#
#aws ec2 create-subnet --vpc-id vpc-8a495fee \
#                      --cidr-block 172.16.1.0 \
#                      --availability-zone us-east-1a \
#                      --generate-cli-skeleton
 # aws ec2 wait subnet-available

 # In AZ 1, create 3 subnets
 # Create 172.16.1.0/24
 # Create 172.16.2.0/24
 # Create 172.16.3.0/24
 # In AZ 2, create 3 subnets
 # Create 172.16.11.0/24
 # Create 172.16.12.0/24
 # Create 172.16.13.0/24

az_spread=2
subnet_spread=3
#
prefix=172
suffix=/24
end_blocks=.0.0
index_az=0
index_subnets=0
#
while [ $index_az -lt $az_spread ]
do
    while [ $index_subnets -lt $subnet_spread ]
    do
        echo "==> subnet pass " $((index_subnets + 1)) "of " $((index_az + 1)) # +1 offset
        ((index_subnets++))
    done;
    ((index_az++))
    index_subnets=0 # reset inner loop index
done;
# END
