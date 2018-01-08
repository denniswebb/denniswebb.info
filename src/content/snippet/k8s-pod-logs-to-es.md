---
title: "Kubernets Pod Logs to Elasticsearch"
date: 2018-01-01
tags: ["kubernetes", "logging", "elasticsearch", "fluentd", "jq", "curl"]
---
While troubleshooting why some pod logs weren't being pushed to Elasticsearch
by Fluentd on our clusters.  I suspected that the format of the logs
themselves were the issue.  After a bit of work I came up with this solution:

```bash
kubectl logs <PODNAME> | jq -c '. | {"index": {}}, .' | curl https://<ELASTICSEARCH_ADDRESS>/<INDEX>/<TYPE>/_bulk --data-bin @-
```

Below is a sample response from sending the last 5 log messages from a pod:

```bash
kubectl logs nginx-2450266744-btprh --tail=5 | jq -c '. | {"index": {}}, .' | curl https://es.denniswebb.info/logs/nginx/_bulk --data-bin @-

{"took":6,"errors":false,"items":[{"index":{"_index":"logs","_type":"nginx","_id":"AWCyakfRf8Ywf7A3rumH","_version":1,"result":"created","_shards":{"total":2,"successful":2,"failed":0},"created":true,"status":201}},{"index":{"_index":"logs","_type":"nginx","_id":"AWCyakfRf8Ywf7A3rumI","_version":1,"result":"created","_shards":{"total":2,"successful":2,"failed":0},"created":true,"status":201}},{"index":{"_index":"logs","_type":"nginx","_id":"AWCyakfRf8Ywf7A3rumJ","_version":1,"result":"created","_shards":{"total":2,"successful":2,"failed":0},"created":true,"status":201}},{"index":{"_index":"logs","_type":"nginx","_id":"AWCyakfRf8Ywf7A3rumK","_version":1,"result":"created","_shards":{"total":2,"successful":2,"failed":0},"created":true,"status":201}},{"index":{"_index":"logs","_type":"nginx","_id":"AWCyakfRf8Ywf7A3rumL","_version":1,"result":"created","_shards":{"total":2,"successful":2,"failed":0},"created":true,"status":201}}]}
```
