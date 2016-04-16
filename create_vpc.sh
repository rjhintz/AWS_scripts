#!/usr/bin/env bash
#
# AWS - Create a VPC
# Setup
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
      # No current VPC with desired CIDR so create one
      # --create as /16 (64K addresses) to /28 (16 addresses)
      # aws ec2 create-vpc  --dry-run | --no-dry-run \
      #                     --instance-tenacy <value>  \
      #                     --cidr-block <value>
      aws ec2 create-vpc  --cidr-block $cidr > create_vpc.json
fi
# Wait until VPC is available or fails to be created
# http://docs.aws.amazon.com/cli/latest/reference/ec2/wait/vpc-available.html
aws ec2 wait vpc-available --filters Name=cidr,Values=$cidr
# ========================================================================
# Describe VPC
aws ec2 describe-vpcs --output table   --filters Name=cidr,Values=$cidr
# END
# name ()
# {
#     commands
# 
#     return
# }
