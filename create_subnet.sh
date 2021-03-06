#!/usr/bin/env bash
#
# Create subject for an already created VPC
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
# Is there a VPC with CIDR 172.16.0.0/20?
default_cidr="172.16.0.0/20"
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
subnet=$(aws ec2 describe-subnets --output text   --filters Name=vpc-id,Values=$vpc | cut -f 8)
if [ "$subnet" ]; then
    echo ""
    aws ec2 describe-subnets --output table  --filters Name=vpc-id,Values=$vpc
    exit
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
# aws ec2 wait subnet-available
#
# In AZ 1, create 3 subnets
#   Create 172.16.1.0/24
#   Create 172.16.2.0/24
#   Create 172.16.3.0/24
# In AZ 2, create 3 subnets
#   Create 172.16.11.0/24
#   Create 172.16.12.0/24
#   Create 172.16.13.0/24
#
# Array - braces expand to 1, 2, 3
cidr_subnets=(172.16.{1..3}.0/24)
#
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
        echo " "
        echo "Create subnet " ${cidr_subnets[$index_subnets]} "in AZ " ${az[$index_az]}
        aws ec2 create-subnet --vpc-id $vpc \
                        --cidr-block ${cidr_subnets[$index_subnets]} \
                        --availability-zone ${az[$index_az]} > create_subnet.json
                     #  --dry-run
#
#  Error handling
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
