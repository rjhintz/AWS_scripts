# AWS Scripts
Some scripts to manage AWS resources.
* Default region: us-east-1

## Process
  1. Create VPC
  2. Create Subnets
  3. Create Internet Gateway
  4. Create Route Tables
    *  Create route Table
    *  Create route to 0.0.0.0/0
    *  Associate Route Table with Subnet designated to be public facing

## Availability Zones
  * Describe AZs

## Networking
### Describe
  * Describe current VPCs
  * Describe current subnets
  * Describe Internet gateways
  * Describe Route tables
 
### Create
* Create VPC(s)
  * Create subnets
    * Basic topology
      * distributed evenly across 2 AZs
      * 6 subnets
      * 3 per AZ
      * plan for 1 public in each AZ, 2 total
      * remaining 4 private, 2 in each AZ
  * Create Internet gateways
    *  create one IGW and attach to VPC
  * Create Route tables
    * Create route table
    * Create route(s) for new route table
    * Associate new route(s) with previously created subnet(s)
