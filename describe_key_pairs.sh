#!/usr/bin/env bash

# Describe AWS AZs
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
aws ec2 describe-key-pairs \
    --output text   # \
    # | cut -f 4
