---
title: "Sorting AWS cli describe-images using jq"
date: 2018-01-04
tags: ["aws", "jq"]
---

To query AWS for a list of AMIs based on filter criteria sorted by date:
```bash
aws ec2 describe-images --filters "Name=root-device-type,Values=ebs","Name=name,Values=amzn-ami-hvm-*" --owners=amazon | jq '.Images | sort_by(.CreationDate) | .[] | {Name: .Name, Created: .CreationDate, Id: .ImageId}'
```

This command should output (shortened for brevity):
```json
{
  "Name": "amzn-ami-hvm-2012.03.3.x86_64-ebs",
  "Created": "2012-06-25T23:14:28.000Z",
  "Id": "ami-44da5574"
}
{
  "Name": "amzn-ami-hvm-2012.09.0.x86_64-ebs",
  "Created": "2012-10-08T18:24:01.000Z",
  "Id": "ami-2431bf14"
}
{
  "Name": "amzn-ami-hvm-2014.03.1.x86_64-s3",
  "Created": "2014-04-10T22:17:23.000Z",
  "Id": "ami-a4254f94"
}
...truncated...
{
  "Name": "amzn-ami-hvm-2017.09.1.20171120-x86_64-s3",
  "Created": "2017-11-20T22:21:25.000Z",
  "Id": "ami-dd4496a5"
}
{
  "Name": "amzn-ami-hvm-2017.09.1.20171120-x86_64-ebs",
  "Created": "2017-11-20T22:24:50.000Z",
  "Id": "ami-694b9911"
}
{
  "Name": "amzn-ami-hvm-2017.09.1.20171120-x86_64-gp2",
  "Created": "2017-11-20T22:24:53.000Z",
  "Id": "ami-bf4193c7"
}
```
