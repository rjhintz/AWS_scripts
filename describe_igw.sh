#!/usr/bin/env bash
#
# AWS - Describe Internet Gateways
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
#
# Is there a VPC with CIDR 172.16.0.0/16?
default_cidr="172.16.0.0/16"
read -p "CIDR? (default: $default_cidr)  " cidr
#
# if $cidr value that's input has regex pattern ^$, it's empty, so use default
if [[ "$cidr" =~ ^$ ]]; then
    cidr=$default_cidr
    echo "using default CIDR $default_cidr";
fi
#
# Describe VPCs
# Describe VPC results fields
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
# Describe IGWs
# Describe IGW results fields
# 1- "INTERNETGATEWAYS"
# 2- InternetGatewayId
# 3- Attachments: State
# 4- Attachments: VpcId
#
aws ec2 describe-internet-gateways --output text \
    --filters Name=attachment.vpc-id,Values=$vpc \
    > describe_igw.txt
igw=$(egrep --only-matching igw-[a-z0-9]{8} describe_igw.txt)
echo "IGW for" $cidr "vpc" $vpc "is" $igw

