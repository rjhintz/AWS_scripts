### Results
```
rjhintz@a01:~/bin$ clear; run_instances.sh 
AWS default region=  us-east-1
```
```json
{
    "Groups": [],
    "ReservationId": "r-06a9c6264628b566f",
    "Instances": [
        {
            "SourceDestCheck": true,
            "PublicDnsName": null,
            "ImageId": "ami-fce3c696",
            "Architecture": "x86_64",
            "VirtualizationType": "hvm",
            "SubnetId": "subnet-7e5bc208",
            "ClientToken": "xxx",
            "PrivateDnsName": "ip-172-30-3-180.ec2.internal",
            "InstanceId": "i-0c5491be39b1a2306",
            "StateTransitionReason": null,
            "RootDeviceType": "ebs",
            "EbsOptimized": false,
            "Hypervisor": "xen",
            "Monitoring": {
                "State": "pending"
            },
            "NetworkInterfaces": [
                {
                    "Attachment": {
                        "DeleteOnTermination": true,
                        "Status": "attaching",
                        "AttachTime": "2016-05-11T23:33:44.000Z",
                        "AttachmentId": "eni-attach-eddf9710",
                        "DeviceIndex": 0
                    },
                    "Groups": [
                        {
                            "GroupId": "sg-931c9aeb",
                            "GroupName": "default"
                        }
                    ],
                    "MacAddress": "0a:d6:e9:6d:d3:1f",
                    "Description": null,
                    "OwnerId": "018883043635",
                    "VpcId": "vpc-5f0c3c3b",
                    "PrivateDnsName": "ip-172-30-3-180.ec2.internal",
                    "NetworkInterfaceId": "eni-928590d2",
                    "SubnetId": "subnet-7e5bc208",
                    "PrivateIpAddresses": [
                        {
                            "PrivateIpAddress": "172.30.3.180",
                            "Primary": true,
                            "PrivateDnsName": "ip-172-30-3-180.ec2.internal"
                        }
                    ],
                    "PrivateIpAddress": "172.30.3.180",
                    "Status": "in-use",
                    "SourceDestCheck": true
                }
            ],
            "KeyName": "K20151219a",
            "RootDeviceName": "/dev/sda1",
            "SecurityGroups": [
                {
                    "GroupId": "sg-931c9aeb",
                    "GroupName": "default"
                }
            ],
            "State": {
                "Name": "pending",
                "Code": 0
            },
            "Placement": {
                "Tenancy": "default",
                "AvailabilityZone": "us-east-1d",
                "GroupName": null
            },
            "BlockDeviceMappings": [],
            "VpcId": "vpc-5f0c3c3b",
            "AmiLaunchIndex": 0,
            "StateReason": {
                "Message": "pending",
                "Code": "pending"
            },
            "LaunchTime": "2016-05-11T23:33:44.000Z",
            "PrivateIpAddress": "172.30.3.180",
            "InstanceType": "t2.nano",
            "ProductCodes": []
        }
    ],
    "OwnerId": "018883043635"
}
```
```
RESERVATIONS
018883043635
r-06a9c6264628b566f
INSTANCES
0
x86_64
xxx
False
xen
ami-fce3c696
i-0c5491be39b1a2306
t2.nano
K20151219a
2016-05-11T23:33:44.000Z
ip-172-30-3-180.ec2.internal
172.30.3.180
None
/dev/sda1
ebs
True
None
subnet-7e5bc208
hvm
vpc-5f0c3c3b
BLOCKDEVICEMAPPINGS
/dev/sda1
EBS
2016-05-11T23:33:44.000Z
True
attached
vol-4b13a1e0
MONITORING
enabled
NETWORKINTERFACES
None
0a:d6:e9:6d:d3:1f
eni-928590d2
018883043635
ip-172-30-3-180.ec2.internal
172.30.3.180
True
in-use
subnet-7e5bc208
vpc-5f0c3c3b
ATTACHMENT
2016-05-11T23:33:44.000Z
eni-attach-eddf9710
True
0
attached
GROUPS
sg-931c9aeb
default
PRIVATEIPADDRESSES
True
ip-172-30-3-180.ec2.internal
172.30.3.180
PLACEMENT
us-east-1d
None
default
SECURITYGROUPS
sg-931c9aeb
default
STATE
16
running
```
