#!/usr/bin/env bash

# Start and run AWS Instances
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS default region= " $AWS_DEFAULT_REGION
#
# Other parameters
vpc="vpc-5f0c3c3b"
vpc_cidr="172.30.0.0/16"
subnet_cidr="172.30.3.0/24"
#
# Instance parameters
image_id="ami-fce3c696" # AMI Ubuntu Server 14.04 LTS (HVM), SSD Volume
key_name="K20151219a"
security_group_ids="sg-931c9aeb"
user_data="sample user data"
instance_type="t2.nano"
monitoring="Enabled=true"
subnet_id="subnet-7e5bc208"
instance_shutdown_behavior="stop"
count=1  # number of instances to start
#
aws ec2 run-instances \
    --no-dry-run  \
    --image-id $image_id  \
    --key-name $key_name   \
    --security-group-ids $security_group_ids   \
    --instance-type $instance_type   \
    --monitoring $monitoring  \
    --subnet-id $subnet_id \
    --enable-api-termination \
    --instance-initiated-shutdown-behavior $instance_shutdown_behavior   \
    --client-token xxx  \
    --additional-info xxx  \
    --no-ebs-optimized  \
    --count $count  \
    --no-associate-public-ip-address \
    > run_instances.json
#
# ---------------------------------------------------------------
#
#  Wait for instance is running
#
aws ec2 wait instance-running  \
    --no-dry-run
#
# ---------------------------------------------------------------
# Put the instances into an array
instances=($(aws ec2 describe-instances --output text)) # \
    # | cut -f 4))
# curly braces are required when expanding arrays
# http://stackoverflow.com/questions/8748831/when-do-we-need-curly-braces-in-variables-using-bash
# echo ${instance[*]}
#
# echo "instances "
# How many are there?
instance_count=${#instances[*]}
# because the compound command (( )) is part of the shell syntax
# rather than an ordinary command, and it deals only with integers,
# it is able to recognize variables by name and does not require expansion to be performed
if (( instance_count == 0)); then
    echo "No running instances"
    exit
fi
# echo "Instance count" $instance_count
#
# List instances
index=0
while [ $index -lt $instance_count ]
do
    echo ${instances[$index]}
    # arithmetic evaluation syntax: ((x))
    ((index++))
done;
#
#   run-instances
#   [--dry-run | --no-dry-run]
#   --image-id <value>
#   [--key-name <value>]
#   [--security-groups <value>]
#   [--security-group-ids <value>]
#   [--user-data <value>]
#   [--instance-type <value>]
#   [--placement <value>]
#   [--kernel-id <value>]
#   [--ramdisk-id <value>]
#   [--block-device-mappings <value>]
#   [--monitoring <value>]
#   [--subnet-id <value>]
#   [--disable-api-termination | --enable-api-termination]
#   [--instance-initiated-shutdown-behavior <value>]
#   [--private-ip-address <value>]
#   [--client-token <value>]
#   [--additional-info <value>]
#   [--network-interfaces <value>]
#   [--iam-instance-profile <value>]
#   [--ebs-optimized | --no-ebs-optimized]
#   [--count <value>]
#   [--secondary-private-ip-addresses <value>]
#   [--secondary-private-ip-address-count <value>]
#   [--associate-public-ip-address | --no-associate-public-ip-address]
######################################################################
