#!/bin/bash
#
# AWS
# Setup
#
# Put the AZs into an array
az=($(aws ec2 describe-availability-zones --output text | cut -f 4))
#
index=0
# How many are there?
az_count=${#az[*]}
while [ $index -lt $az_count ]
do
    echo ${az[$index]}
    # arithmetic evaluation syntax ((x))
    ((index++))
done;
# List a single AZ
# echo "AZ 0 " ${az[0]}
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
# if $vpc = regex ^$, then no VPC with specified CIDR
if [[ "$vpc" =~ ^$ ]]; then
      echo "No VPC with CIDR $cidr"
      # No VPC with desired CIDR so create one
      # --create as /16
      # aws ec2 create-vpc  --cidr-block <value>
      aws ec2 create-vpc  --cidr-block $cidr
fi
# Wait until VPC is available or fails to be created
# http://docs.aws.amazon.com/cli/latest/reference/ec2/wait/vpc-available.html
aws ec2 wait vpc-available --filters Name=cidr,Values=$cidr
# ========================================================================
# Describe VPC
aws ec2 describe-vpcs --output table   --filters Name=cidr,Values=$cidr
# ========================================================================
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
aws ec2 describe-subnets --output text   --filters Name=vpc-id,Values=$vpc | cut -f 8 >subnet
if [ "$subnet" ]; then
    echo ""
    aws ec2 describe-subnets --output table  --filters Name=vpc-id,Values=$vpc
else
    echo ""
    echo "No VPC subnets for CIDR $cidr"
fi
# Create 6 subnets
# --create each as /24
# --spread evenly across 2 AZs
# --some AZs may not allow subnet creation
# aws ec2 create-subnet --vpc-id <value> \
#                       --cidr-block <value> \
#                       --availability-zone <value> \
#                       --dry-run | --no-dry-run
#    index=0
#   # How many are there?
#   az_count=${#az[*]}
#   while [ $index -lt $az_count ]
#   do
#       echo ${az[$index]}
#       # arithmetic evaluation syntax ((x))
#       ((index++))
#   done;
az_spread=2
subnets_per_az=3


#   y=bar
#   z=$x$y        # $z is now "foobar"
#   z="$x$y"      # $z is still "foobar"
#   z="$xand$y"   # does not work
#   z="${x}and$y" # does work, "fooandbar"
#   z="$x and $y" # does work, "foo and bar"

 aws ec2 create-subnet --vpc-id $vpc \
                       --cidr-block 172.16.1.0/24 \
                       --availability-zone ${az[0]} \
                       --no-dry-run # | --no-dry-run




  aws ec2 wait subnet-available

aws ec2 describe-subnets --output text   --filters Name=vpc-id,Values=$vpc | cut -f 8 >subnet
if [ "$subnet" ]; then
    echo ""
    aws ec2 describe-subnets --output table  --filters Name=vpc-id,Values=$vpc
else
    echo ""
    echo "No VPC subnets for CIDR $cidr"
fi
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
