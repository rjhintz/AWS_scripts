#!/bin/bash
#
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
# aws ec2 create-subnet --vpc-id <value> \
#                       --cidr-block <value> \
#                       --availability-zone <value>
# aws ec2 wait subnet-available
#
# use --cli-input-json parameter after --generate-cli-skeleton
# aws ec2 run-instances --cli-input-json file://ec2runinst.json
#
 aws ec2 create-subnet --vpc-id vpc-8a495fee \
                       --cidr-block 172.16.1.0 \
                       --availability-zone us-east-1a \
                       --generate-cli-skeleton
 # aws ec2 wait subnet-available

