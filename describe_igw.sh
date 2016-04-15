#!/bin/bash
#
# AWS - Describe Internet Gateways
#
export AWS_DEFAULT_REGION=us-east-1
echo "AWS_DEFAULT_REGION= " $AWS_DEFAULT_REGION
#
# Describe IGWs
# Describe IGW results fields
# 1- "INTERNETGATEWAYS"
# 2- InternetGatewayId
# 3- Attachments: State
# 4- Attachments: VpcId
#
aws ec2 describe-internet-gateways --output text #  --filters Name=attachment.vpc-id,Values=$vpc
