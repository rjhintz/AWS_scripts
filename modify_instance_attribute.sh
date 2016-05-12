#!/bin/bash
aws ec2 modify-instance-attribute  \
    --no-dry-run  \
    --instance-id $instance_id  \
    --
