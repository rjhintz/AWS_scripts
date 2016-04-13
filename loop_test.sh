#!/bin/bash
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
az=($(aws ec2 describe-availability-zones --output text | cut -f 4))

index=0
element_count=${#az[*]}
while [ $index -lt $element_count ]
do
    echo ${az[$index]}
    # arithmetic evaluation ((x))
    ((index++))
done;
# ====================================================================
# Put the AZs into an array
az=($(aws ec2 describe-availability-zones --output text | cut -f 4))
#
index=0
# How many are there?
az_count=${#az[*]}
echo "AZ count " $az_count
# List AZs
while [ $index -lt $az_count ]
do
    echo ${az[$index]}
    # arithmetic evaluation syntax ((x))
    ((index++))
done;
#
# ====================================================================
# Loops
az_spread=2
subnet_spread=3
#
index_az=0
index_subnets=0
#
while [ $index_az -lt $az_spread ]
do
    echo "az pass begin az_index" $index_az
    while [ $index_subnets -lt $subnet_spread ]
    do
        echo "subnet pass subnet index " $index_subnets
        # arithmetic evaluation syntax ((x))
        ((index_subnets++))
        echo "subnet pass post increment subnet index " $index_subnets
    done;
    index_subnets=0
# arithmetic evaluation syntax ((x))
((index_az++))
echo "az pass post increment AZ index " $index_az
done;
#
#  a=z                   # Assign the string "z" to variable a
#  b="a string"         # Embedded spaces must be within quotes.
#  c="a string and $b"  # Other expansions such as variables can be expanded into the assignment.
#  d=$(ls -l foo.txt)   # Results of a command.
#  e=$((5 * 7))         # Arithmetic expansion.
#  f="\t\ta string\n"   # Escape sequences such as tabs and newlines.
