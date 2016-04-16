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
```
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
