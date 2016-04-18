#!/usr/bin/env bash
#
# AWS - Create Route Table, Create Route, Associate with Subnet
#
# name ()
# {
#     commands
#     return
# }
# Describe Current Route Tables
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
# Describe RTs
# Describe RT results fields
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
aws ec2 describe-route-tables --output json > describe_route_tables.json
#
# Describe VPC
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
# if $vpc = regex ^$, then no VPC with specified CIDR
if [[ "$vpc" =~ ^$ ]]; then \
    echo "No VPC with CIDR $cidr"
else
    aws ec2 describe-vpcs --output json --filters Name=cidr,Values=$cidr \
        > describe_vpcs.json
fi
#
# Describe Subnets, then get those for public
aws ec2 describe-subnets --output text  --filters Name=vpc-id,Values=$vpc \
    > describe_subnets.txt
#
# Describe IGW
aws ec2 describe-internet-gateways --output text \
    --filters Name=attachment.vpc-id,Values=$vpc \
    > describe_igw.txt
igw=$(egrep --only-matching igw-[a-z0-9]{8} describe_igw.txt)
#
# Create Route Table
aws ec2 create-route-table --vpc-id $vpc > create_route_table.json
rtb_id=$(egrep --only-matching rtb-[a-z0-9]{8} create_route_table.json)
echo " "
echo "rtb created" $rtb_id "for VPC" $vpc
#
# Create Route
cidr_all=0.0.0.0/0
aws ec2 create-route --route-table-id $rtb_id \
    --destination-cidr-block $cidr_all  \
    --gateway-id $igw
echo "Route created for" $cidr_all "to IGW" $igw
#
# Associate RTB(s) with Subnet(s)
aws ec2 describe-subnets --output text \
    --filters Name=vpc-id,Values=$vpc  \
    > describe_subnets.txt
subnet_public_1=$(egrep 172.16.1.0 describe_subnets.txt  \
    | egrep --only-matching subnet-[a-z0-9]{8})
echo "subnet_public_1" $subnet_public_1
echo ""
#
subnet_public_2=$(egrep 172.16.11.0 describe_subnets.txt  \
    | egrep --only-matching subnet-[a-z0-9]{8})
echo "subnet_public_2" $subnet_public_2
aws ec2 associate-route-table \
    --subnet-id subnet_public_1  \
    --route-table-id $rtb_id
#echo "Route table" $rtb-id "subnet" $subnet-id
