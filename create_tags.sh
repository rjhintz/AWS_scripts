#!/bin/bash
instance_id="i-0c26c6d08ad043653"
aws ec2 create-tags  \
    --no-dry-run  \
    --resources $instance_id  \
    --tags Key=Name,Value=ChangedName
