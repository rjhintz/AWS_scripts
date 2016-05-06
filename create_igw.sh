#!/usr/bin/env bash
#
# AWS - Create Internet Gateway
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
# Is there a VPC with the default CIDR?
default_cidr="172.16.0.0/16"
read -p "CIDR? (default: $default_cidr)  " cidr
#
# if $cidr value that's input has regex pattern ^$, it's empty, so use default
if [[ "$cidr" =~ ^$ ]]; then
    cidr=$default_cidr
    echo "using default CIDR $default_cidr";
fi
# Get VPC value
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
# if $vpc = regex ^$, then no VPC with specified CIDR
if [[ "$vpc" =~ ^$ ]]; then
    echo "No VPC with CIDR $cidr"
else
    aws ec2 describe-vpcs --output text   --filters Name=cidr,Values=$cidr
    echo " "
    # Describe IGW results fields
    # 1- "INTERNETGATEWAYS"
    # 2- InternetGatewayId
    # 3- Attachments: State
    # 4- Attachments: VpcId
    #
    echo "Is there an Internet Gateway attached to the relevant VPC? "
    aws ec2 describe-internet-gateways --output text #  --filters Name=attachment.vpc-id,Values=$vpc
fi
#
echo " "
aws ec2 create-internet-gateway > create_igw.json
igw=$(cat create_igw.json | egrep --only-matching igw-[a-z0-9]{8} create_igw.json)
echo "New IGW " $igw
# Attach newly created IGW to VPC
aws ec2 attach-internet-gateway \
    --internet-gateway-id $igw  \
    --vpc-id $vpc
#
echo " "
aws ec2 describe-internet-gateways --output text #  --filters Name=attachment.vpc-id,Values=$vpc
# END
