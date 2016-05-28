#  Simple Systems Manager (SSM)
[Manage Amazon EC2 Instances Remotely]
(https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/execute-remote-commands.html?icmpid=docs_ec2_console)

## Install SSM Agent at Startup (Ubuntu)
Include other startup functions:
* update


```
#!/usr/bin/env bash
echo "============> sudo apt-get update"
sudo apt-get update
echo "============> sudo apt-get -y dist-upgrade"
sudo apt-get -y dist-upgrade
echo "============> sudo apt-get autoremove"
sudo apt-get autoremove
echo "============> Begin SSM Agent Install"
cd /tmp
curl https://amazon-ssm-us-east-1.s3.amazonaws.com/latest/debian_amd64/amazon-ssm-agent.deb -o amazon-ssm-agent.deb
dpkg -i amazon-ssm-agent.deb
echo "============> End SSM Agent Install"
```

## Output to S3
Bucket: `rjhintz-ssm-output-20160524`

Output folder: `ssm-test-1`
