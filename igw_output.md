### Internet Gateway Outputs
#### describe-internet-gateways
#### Text
```txt
INTERNETGATEWAYS	igw-0fa1166b
ATTACHMENTS	available	vpc-5f0c3c3b
INTERNETGATEWAYS	igw-33e15257
ATTACHMENTS	available	vpc-07093663
INTERNETGATEWAYS	igw-9adb4cfe
ATTACHMENTS	available	vpc-feaab09a
```
#### Text and Filter on VPC
```
$  aws ec2 describe-internet-gateways --output=text --filter=Name=attachment.vpc-id,Values=vpc-feaab09a
INTERNETGATEWAYS	igw-9adb4cfe
ATTACHMENTS	available	vpc-feaab09a
```
#### Table
```txt
-----------------------------------
|    DescribeInternetGateways     |
+---------------------------------+
||       InternetGateways        ||
|+-------------------------------+|
||       InternetGatewayId       ||
|+-------------------------------+|
||  igw-0fa1166b                 ||
|+-------------------------------+|
|||         Attachments         |||
||+------------+----------------+||
|||    State   |     VpcId      |||
||+------------+----------------+||
|||  available |  vpc-5f0c3c3b  |||
||+------------+----------------+||
||       InternetGateways        ||
|+-------------------------------+|
||       InternetGatewayId       ||
|+-------------------------------+|
||  igw-33e15257                 ||
|+-------------------------------+|
|||         Attachments         |||
||+------------+----------------+||
|||    State   |     VpcId      |||
||+------------+----------------+||
|||  available |  vpc-07093663  |||
||+------------+----------------+||
||       InternetGateways        ||
|+-------------------------------+|
||       InternetGatewayId       ||
|+-------------------------------+|
||  igw-9adb4cfe                 ||
|+-------------------------------+|
|||         Attachments         |||
||+------------+----------------+||
|||    State   |     VpcId      |||
||+------------+----------------+||
|||  available |  vpc-feaab09a  |||
||+------------+----------------+||
```
#### JSON
```json
{
    "InternetGateways": [
        {
            "Attachments": [
                {
                    "VpcId": "vpc-5f0c3c3b",
                    "State": "available"
                }
            ],
            "Tags": [],
            "InternetGatewayId": "igw-0fa1166b"
        },
        {
            "Attachments": [
                {
                    "VpcId": "vpc-07093663",
                    "State": "available"
                }
            ],
            "Tags": [],
            "InternetGatewayId": "igw-33e15257"
        },
        {
            "Attachments": [
                {
                    "VpcId": "vpc-feaab09a",
                    "State": "available"
                }
            ],
            "Tags": [],
            "InternetGatewayId": "igw-9adb4cfe"
        }
    ]
}
