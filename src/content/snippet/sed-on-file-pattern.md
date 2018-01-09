---
title: "Sed on File Pattern"
date: 2018-01-09
tags: ["fish","sed","yaml"]
---

This command edits all files matching the pattern `deployment*` and prepends
```yaml
      securityContext:
        runAsNonRoot: false
```
before that reads `      nodeSelector:`.

```bash
find -type f -name "deployment*" | xargs -I "%" sed -i 's/      nodeSelector:/      securityContext:\n        runAsNonRoot: false\n&/g' "%"
```

Before
```yaml
    spec:
      nodeSelector:
        usage: "data"
      containers:
```
After
```yaml
    spec:
      securityContext:
        runAsNonRoot: false
      nodeSelector:
        usage: "data"
      containers:
```
