---
title: "Clone All Github Repos From CircleCI"
date: 2018-08-07
tags: ["fish","git","github","circleci"]
---
If for some reason you need to clone all of your organization's repos at once, here's a nice snippet to handle that.
```bash
ORGANIZATION=denniswebb
curl "https://circleci.com/api/v1.1/projects?circle-token=$CIRCLE_TOKEN" | jq -r '.[] | select(.username=="$ORGANIZATION") | .reponame' | xargs -I "%" git clone git@github.com:$ORGANIZATION/"%".git
```
