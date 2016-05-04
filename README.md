# AWS Scripts
Some scripts to manage AWS resources
## Networking
  * Describe current and create VPCs
  * Describe current and create subnets
    * Basic topology
      * distributed evenly across 2 AZs
      * 6 subnets
      * 3 per AZ
      * plan for 1 public in each AZ, 2 total
      * remaining 4 private, 2 in each AZ
  * Internet gateway
    *  create one IGW and attach to VPC
  * Route table
    * Describe current
    * Create route table
    * Create route(s) for new route table
    * Associate new route(s) with subnet(s)
