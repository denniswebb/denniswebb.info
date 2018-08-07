---
title: "Create SSH Public Key From Private Key"
date: 2018-08-06
tags: ["ssh"]
---
If you allow AWS to create your PEM file for you, you'll often end up needing the public key that goes with it. Use the following command to regenerate the public key from the private one.
```bash
ssh-keygen -y -f ~/mykey.pem > ~/.ssh/mykey.pub
```
