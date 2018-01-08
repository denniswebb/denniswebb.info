---
title: "Bulk Cancel of CircleCI Jobs"
date: 2018-01-08
---
Hopefully you will never need this.  Below is a small fish script that will cancel CircleCI jobs that are running/pending.
```bash
for num in (seq 126 813)
    curl "https://circleci.com/api/v1.1/project/github/denniswebb/denniswebb.info/$num/cancel?circle-token=$CIRCLE_TOKEN" -XPOST
end
```
`seq 126 813` is used to set the start and end numbers for the loop
`CIRCLE_TOKEN` is set to your CircleCI API token
Replace `denniswebb` with your GitHub organization name.
Replace `dennniswebb.info` with your repository name.
