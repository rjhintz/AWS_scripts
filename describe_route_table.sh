#!/usr/bin/env bash
#
# AWS - Describe Route Tables
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
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
# Describe Route Tables
# Describe RouteTable results fields
#"RouteTables":
#    "Associations":
#    "RouteTableAssociationId": "rtbassoc-854d6be2",
#        "Main": true,
#        "RouteTableId": "rtb-ec7abd8b"
#    "Tags": [],
#    "Routes": [
#        "Origin": "CreateRouteTable",
#        "State": "active",
#        "DestinationCidrBlock": "172.30.0.0/16",
#        "GatewayId": "local"
#
#        "Origin": "CreateRoute",
#        "State": "active",
#        "DestinationCidrBlock": "0.0.0.0/0",
#        "GatewayId": "igw-0fa1166b"
aws ec2 describe-route-tables --output text #  --filters Name=vpc-id,Values=$vpc
