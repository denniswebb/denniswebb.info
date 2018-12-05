---
title: "Formatting and Assigning Driver Letters to Windows EBS Volumes"
date: 2018-12-04
tags: ['aws','ebs','userdat','windows']
---

Use the following PowerShell in your UserData to format and assign Windows drive letters to additional EBS volumes on instance launch.

```powershell
<powershell>
Get-Disk 1 |
Initialize-Disk -PartitionStyle GPT -PassThru |
New-Partition -DriveLetter E -UseMaximumSize |
Format-Volume -FileSystem NTFS -NewFileSystemLabel "Data" -Confirm:$false

Get-Disk 2 |
Initialize-Disk -PartitionStyle GPT -PassThru |
New-Partition -DriveLetter L -UseMaximumSize |
Format-Volume -FileSystem NTFS -NewFileSystemLabel "Logs" -Confirm:$false
</powershell>
```
