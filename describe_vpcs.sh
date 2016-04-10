#!/bin/bash

# AWS
# Is there a VPC with CIDR 172.16.0.0/16?
default_cidr="172.16.0.0/16"
read -p "CIDR? (default: $default_cidr)  " cidr

# if $cidr value that's input has regex pattern ^$, it's empty, so use default
if [[ "$cidr" =~ ^$ ]]; then
      cidr=$default_cidr
      echo "using default CIDR $default_cidr";
fi

#
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
# if $vpc = regex ^$, then no VPC with specified CIDR
if [[ "$vpc" =~ ^$ ]]; then
      echo "No VPC with CIDR $cidr"
else
      # Describe VPC
      aws ec2 describe-vpcs --output table   --filters Name=cidr,Values=$cidr
fi

#

# Describe subnets
# Describe subnet fields
# 1- "SUBNETS"
# 2- AvailabilityZone
# 3- AvailableIpAddressCount
# 4- CidrBlock
# 5- DefaultForAz
# 6- MapPublicIpOnLaunch
# 7- State
# 8- SubnetId
# 9- VpcId
if [ "$vpc" ]; then
    echo ""
#   aws ec2 describe-subnets --output text   --filters Name=vpc-id,Values=$vpc | cut -f 1,2,4,7,8
    aws ec2 describe-subnets --output text  --filters Name=vpc-id,Values=$vpc
else
    echo "No VPC subnets for CIDR $cidr"
fi

# Create subnets
# --create as /24
# --spread across >1 AZ
# --public: web facing for ELB only (?)
# --private: web and DB tiers

# aws ec2 create-subnet --vpc-id <value> \
#                       --cidr-block <value> \
#                       --availability-zone <value>
# aws ec2 wait subnet-available


# ========================================================================
# Put in ˜/bin - Needs chmod 755 <filename>
# Execute: ./hello_world
# echo 'Hello World!' #another comment
#
#  a=z                   # Assign the string "z" to variable a
#  b="a string"         # Embedded spaces must be within quotes.
#  c="a string and $b"  # Other expansions such as variables can be expanded into the assignment.
#  d=$(ls -l foo.txt)   # Results of a command.
#  e=$((5 * 7))         # Arithmetic expansion.
#  f="\t\ta string\n"   # Escape sequences such as tabs and newlines.
#
