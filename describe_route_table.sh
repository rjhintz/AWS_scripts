#!/usr/bin/env bash
#
# AWS - Describe Route Tables
#
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
aws ec2 describe-route-tables --output text #  --filters Name=vpc-id,Values=$vpc
