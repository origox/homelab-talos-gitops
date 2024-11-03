# Cloud native distributed block storage for Kubernetes - Longhorn

## Inspiration
[Getting started with Longhorn](https://youtu.be/SDI9Tly5YDo)

## Add S3 backup to Truenas Scale using Minio
[How to create certificate to use https](https://youtu.be/TJ5fDiDRcbU)
[Setup Minio on Truenas Scale](https://youtu.be/uIm41PhGEgQ)

- choose certificate to use
- create new dataset for Minio to use
- In Minio create new bucket and access keys

Note: 
"backupTarget: s3://s3-longhorn-backup@eu-north-se2/"
- s3-longhorn-backup = bucket in Minio
- eu-north-se2 = server location in Minio


```bash
# Base64 encode secret
echo -n "https://myurl.io:9002" | base64

# output from above is added to longhorn.secret.yaml

# Sops/Age encrypt secret file to proper sops yaml. 
encrypt longhorn.secret.yaml > longhorn.secret.sops.yaml
```
