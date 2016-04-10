#!/bin/bash
#
# Create subnets
# --create as /24
# --spread across >1 AZ
# --public: web facing for ELB only (?)
# --private: web and DB tiers

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
