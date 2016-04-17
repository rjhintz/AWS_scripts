### Route Table Command Output
#### Create Route Table Output
```json
{                                                                                            
"RouteTable": {
    "Tags": [],
    "PropagatingVgws": [],
     "VpcId": "vpc-feaab09a"
     "RouteTableId": "rtb-71ac3116",
      "Routes": [
         {
               "State": "active",
               "DestinationCidrBlock": "172.16.0.0/16",
               "Origin": "CreateRouteTable",
               "GatewayId": "local"
         }
      ],
      "Associations": []
    }
 }
```
#### Table Output
```
----------------------------------------------------------------------------
|                            DescribeRouteTables                           |
+--------------------------------------------------------------------------+
||                               RouteTables                              ||
|+-----------------------------------+------------------------------------+|
||           RouteTableId            |               VpcId                ||
|+-----------------------------------+------------------------------------+|
||  rtb-ec7abd8b                     |  vpc-5f0c3c3b                      ||
|+-----------------------------------+------------------------------------+|
|||                             Associations                             |||
||+---------+-------------------------------------+----------------------+||
|||  Main   |       RouteTableAssociationId       |    RouteTableId      |||
||+---------+-------------------------------------+----------------------+||
|||  True   |  rtbassoc-854d6be2                  |  rtb-ec7abd8b        |||
||+---------+-------------------------------------+----------------------+||
|||                                Routes                                |||
||+-----------------------+---------------+--------------------+---------+||
||| DestinationCidrBlock  |   GatewayId   |      Origin        |  State  |||
||+-----------------------+---------------+--------------------+---------+||
|||  172.30.0.0/16        |  local        |  CreateRouteTable  |  active |||
|||  0.0.0.0/0            |  igw-0fa1166b |  CreateRoute       |  active |||
||+-----------------------+---------------+--------------------+---------+||
||                               RouteTables                              ||
|+-----------------------------------+------------------------------------+|
||           RouteTableId            |               VpcId                ||
|+-----------------------------------+------------------------------------+|
||  rtb-50ad6137                     |  vpc-07093663                      ||
|+-----------------------------------+------------------------------------+|
|||                             Associations                             |||
||+---------+-------------------------------------+----------------------+||
|||  Main   |       RouteTableAssociationId       |    RouteTableId      |||
||+---------+-------------------------------------+----------------------+||
|||  True   |  rtbassoc-860029e1                  |  rtb-50ad6137        |||
||+---------+-------------------------------------+----------------------+||
|||                                Routes                                |||
||+-----------------------+---------------+--------------------+---------+||
||| DestinationCidrBlock  |   GatewayId   |      Origin        |  State  |||
||+-----------------------+---------------+--------------------+---------+||
|||  172.31.0.0/16        |  local        |  CreateRouteTable  |  active |||
|||  0.0.0.0/0            |  igw-33e15257 |  CreateRoute       |  active |||
||+-----------------------+---------------+--------------------+---------+||
||                               RouteTables                              ||
|+-----------------------------------+------------------------------------+|
||           RouteTableId            |               VpcId                ||
|+-----------------------------------+------------------------------------+|
||  rtb-e69a0e81                     |  vpc-c4021da0                      ||
|+-----------------------------------+------------------------------------+|
|||                             Associations                             |||
||+---------+-------------------------------------+----------------------+||
|||  Main   |       RouteTableAssociationId       |    RouteTableId      |||
||+---------+-------------------------------------+----------------------+||
|||  True   |  rtbassoc-471bf621                  |  rtb-e69a0e81        |||
||+---------+-------------------------------------+----------------------+||
|||                                Routes                                |||
||+------------------------+-------------+--------------------+----------+||
|||  DestinationCidrBlock  |  GatewayId  |      Origin        |  State   |||
||+------------------------+-------------+--------------------+----------+||
|||  172.16.0.0/16         |  local      |  CreateRouteTable  |  active  |||
||+------------------------+-------------+--------------------+----------+||
```

#### Text Output
```
ROUTETABLES	rtb-ec7abd8b	vpc-5f0c3c3b
ASSOCIATIONS	True	rtbassoc-854d6be2	rtb-ec7abd8b
ROUTES	172.30.0.0/16	local	CreateRouteTable	active
ROUTES	0.0.0.0/0	igw-0fa1166b	CreateRoute	active
ROUTETABLES	rtb-50ad6137	vpc-07093663
ASSOCIATIONS	True	rtbassoc-860029e1	rtb-50ad6137
ROUTES	172.31.0.0/16	local	CreateRouteTable	active
ROUTES	0.0.0.0/0	igw-33e15257	CreateRoute	active
ROUTETABLES	rtb-e69a0e81	vpc-c4021da0
ASSOCIATIONS	True	rtbassoc-471bf621	rtb-e69a0e81
ROUTES	172.16.0.0/16	local	CreateRouteTable	active
```

#### JSON Output
```json
{
    "RouteTables": [
        {
            "Associations": [
                {
                    "RouteTableAssociationId": "rtbassoc-854d6be2",
                    "Main": true,
                    "RouteTableId": "rtb-ec7abd8b"
                }
            ],
            "Tags": [],
            "Routes": [
                {
                    "Origin": "CreateRouteTable",
                    "State": "active",
                    "DestinationCidrBlock": "172.30.0.0/16",
                    "GatewayId": "local"
                },
                {
                    "Origin": "CreateRoute",
                    "State": "active",
                    "DestinationCidrBlock": "0.0.0.0/0",
                    "GatewayId": "igw-0fa1166b"
                }
            ],
            "RouteTableId": "rtb-ec7abd8b",
            "VpcId": "vpc-5f0c3c3b",
            "PropagatingVgws": []
        },
        {
            "Associations": [
                {
                    "RouteTableAssociationId": "rtbassoc-860029e1",
                    "Main": true,
                    "RouteTableId": "rtb-50ad6137"
                }
            ],
            "Tags": [],
            "Routes": [
                {
                    "Origin": "CreateRouteTable",
                    "State": "active",
                    "DestinationCidrBlock": "172.31.0.0/16",
                    "GatewayId": "local"
                },
                {
                    "Origin": "CreateRoute",
                    "State": "active",
                    "DestinationCidrBlock": "0.0.0.0/0",
                    "GatewayId": "igw-33e15257"
                }
            ],
            "RouteTableId": "rtb-50ad6137",
            "VpcId": "vpc-07093663",
            "PropagatingVgws": []
        },
        {
            "Associations": [
                {
                    "RouteTableAssociationId": "rtbassoc-471bf621",
                    "Main": true,
                    "RouteTableId": "rtb-e69a0e81"
                }
            ],
            "Tags": [],
            "Routes": [
                {
                    "Origin": "CreateRouteTable",
                    "State": "active",
                    "DestinationCidrBlock": "172.16.0.0/16",
                    "GatewayId": "local"
                }
            ],
            "RouteTableId": "rtb-e69a0e81",
            "VpcId": "vpc-c4021da0",
            "PropagatingVgws": []
        }
    ]
}
```
###3 Table with Custom Table for Public Subnets
One VPC
```
rjhintz@a01:~/bin$ aws ec2 describe-route-tables --output=table --filter=Name=vpc-id,Values=vpc-feaab09a
-----------------------------------------------------------------------------
|                            DescribeRouteTables                            |
+---------------------------------------------------------------------------+
||                               RouteTables                               ||
|+-----------------------------------+-------------------------------------+|
||           RouteTableId            |                VpcId                ||
|+-----------------------------------+-------------------------------------+|
||  rtb-c68518a1                     |  vpc-feaab09a                       ||
|+-----------------------------------+-------------------------------------+|
|||                             Associations                              |||
||+-------+---------------------------+---------------+-------------------+||
||| Main  |  RouteTableAssociationId  | RouteTableId  |     SubnetId      |||
||+-------+---------------------------+---------------+-------------------+||
|||  False|  rtbassoc-81e710e7        |  rtb-c68518a1 |  subnet-98afe4a5  |||
||+-------+---------------------------+---------------+-------------------+||
|||                                Routes                                 |||
||+-----------------------+----------------+--------------------+---------+||
||| DestinationCidrBlock  |   GatewayId    |      Origin        |  State  |||
||+-----------------------+----------------+--------------------+---------+||
|||  172.16.0.0/16        |  local         |  CreateRouteTable  |  active |||
|||  0.0.0.0/0            |  igw-9adb4cfe  |  CreateRoute       |  active |||
||+-----------------------+----------------+--------------------+---------+||
|||                                 Tags                                  |||
||+-----------------+-----------------------------------------------------+||
|||       Key       |                        Value                        |||
||+-----------------+-----------------------------------------------------+||
|||  Name           |  rtb-public-useast1c                                |||
||+-----------------+-----------------------------------------------------+||
||                               RouteTables                               ||
|+-----------------------------------+-------------------------------------+|
||           RouteTableId            |                VpcId                ||
|+-----------------------------------+-------------------------------------+|
||  rtb-66841901                     |  vpc-feaab09a                       ||
|+-----------------------------------+-------------------------------------+|
|||                             Associations                              |||
||+-------+---------------------------+---------------+-------------------+||
||| Main  |  RouteTableAssociationId  | RouteTableId  |     SubnetId      |||
||+-------+---------------------------+---------------+-------------------+||
|||  False|  rtbassoc-6ce6110a        |  rtb-66841901 |  subnet-f1105687  |||
||+-------+---------------------------+---------------+-------------------+||
|||                                Routes                                 |||
||+------------------------+-------------+---------------------+----------+||
|||  DestinationCidrBlock  |  GatewayId  |       Origin        |  State   |||
||+------------------------+-------------+---------------------+----------+||
|||  172.16.0.0/16         |  local      |  CreateRouteTable   |  active  |||
||+------------------------+-------------+---------------------+----------+||
|||                                 Tags                                  |||
||+-----------------+-----------------------------------------------------+||
|||       Key       |                        Value                        |||
||+-----------------+-----------------------------------------------------+||
|||  Name           |  rtb-public-useast1d                                |||
||+-----------------+-----------------------------------------------------+||
||                               RouteTables                               ||
|+-----------------------------------+-------------------------------------+|
||           RouteTableId            |                VpcId                ||
|+-----------------------------------+-------------------------------------+|
||  rtb-b89508df                     |  vpc-feaab09a                       ||
|+-----------------------------------+-------------------------------------+|
|||                             Associations                              |||
||+---------+--------------------------------------+----------------------+||
|||  Main   |       RouteTableAssociationId        |    RouteTableId      |||
||+---------+--------------------------------------+----------------------+||
|||  True   |  rtbassoc-c18c7ba7                   |  rtb-b89508df        |||
||+---------+--------------------------------------+----------------------+||
|||                                Routes                                 |||
||+------------------------+-------------+---------------------+----------+||
|||  DestinationCidrBlock  |  GatewayId  |       Origin        |  State   |||
||+------------------------+-------------+---------------------+----------+||
|||  172.16.0.0/16         |  local      |  CreateRouteTable   |  active  |||
||+------------------------+-------------+---------------------+----------+||
rjhintz@a01:~/bin$ aws ec2 describe-route-tables --output=text --filter=Name=vpc-id,Values=vpc-feaab09a
ROUTETABLES	rtb-c68518a1	vpc-feaab09a
ASSOCIATIONS	False	rtbassoc-81e710e7	rtb-c68518a1	subnet-98afe4a5
ROUTES	172.16.0.0/16	local	CreateRouteTable	active
ROUTES	0.0.0.0/0	igw-9adb4cfe	CreateRoute	active
TAGS	Name	rtb-public-useast1c
ROUTETABLES	rtb-66841901	vpc-feaab09a
ASSOCIATIONS	False	rtbassoc-6ce6110a	rtb-66841901	subnet-f1105687
ROUTES	172.16.0.0/16	local	CreateRouteTable	active
TAGS	Name	rtb-public-useast1d
ROUTETABLES	rtb-b89508df	vpc-feaab09a
ASSOCIATIONS	True	rtbassoc-c18c7ba7	rtb-b89508df
ROUTES	172.16.0.0/16	local	CreateRouteTable	active
rjhintz@a01:~/bin$ aws ec2 describe-route-tables --output=json --filter=Name=vpc-id,Values=vpc-feaab09a
```
```json
{
    "RouteTables": [
        {
            "PropagatingVgws": [],
            "VpcId": "vpc-feaab09a",
            "Tags": [
                {
                    "Value": "rtb-public-useast1c",
                    "Key": "Name"
                }
            ],
            "Routes": [
                {
                    "DestinationCidrBlock": "172.16.0.0/16",
                    "Origin": "CreateRouteTable",
                    "GatewayId": "local",
                    "State": "active"
                },
                {
                    "DestinationCidrBlock": "0.0.0.0/0",
                    "Origin": "CreateRoute",
                    "GatewayId": "igw-9adb4cfe",
                    "State": "active"
                }
            ],
            "Associations": [
                {
                    "RouteTableId": "rtb-c68518a1",
                    "SubnetId": "subnet-98afe4a5",
                    "RouteTableAssociationId": "rtbassoc-81e710e7",
                    "Main": false
                }
            ],
            "RouteTableId": "rtb-c68518a1"
        },
        {
            "PropagatingVgws": [],
            "VpcId": "vpc-feaab09a",
            "Tags": [
                {
                    "Value": "rtb-public-useast1d",
                    "Key": "Name"
                }
            ],
            "Routes": [
                {
                    "DestinationCidrBlock": "172.16.0.0/16",
                    "Origin": "CreateRouteTable",
                    "GatewayId": "local",
                    "State": "active"
                }
            ],
            "Associations": [
                {
                    "RouteTableId": "rtb-66841901",
                    "SubnetId": "subnet-f1105687",
                    "RouteTableAssociationId": "rtbassoc-6ce6110a",
                    "Main": false
                }
            ],
            "RouteTableId": "rtb-66841901"
        },
        {
            "PropagatingVgws": [],
            "VpcId": "vpc-feaab09a",
            "Tags": [],
            "Routes": [
                {
                    "DestinationCidrBlock": "172.16.0.0/16",
                    "Origin": "CreateRouteTable",
                    "GatewayId": "local",
                    "State": "active"
                }
            ],
            "Associations": [
                {
                    "RouteTableId": "rtb-b89508df",
                    "RouteTableAssociationId": "rtbassoc-c18c7ba7",
                    "Main": true
                }
            ],
            "RouteTableId": "rtb-b89508df"
        }
    ]
}
```
