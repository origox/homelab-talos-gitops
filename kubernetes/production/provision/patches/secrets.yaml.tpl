cluster:
    id: op://Homelab/Talos/CLUSTER_ID
    secret: op://Homelab/Talos/CLUSTER_SECRET
secrets:
    bootstraptoken: op://Homelab/Talos/SECRETS_BOOTSTRAPTOKEN
    secretboxencryptionsecret: op://Homelab/Talos/SECRETS_SECRETBOXENCRYPTIONSECRET
trustdinfo:
    token: op://Homelab/Talos/TRUSTINFO_TOKEN
certs:
    etcd:
        crt: op://Homelab/Talos/CERTS_ETCD_CRT
        key: op://Homelab/Talos/CERTS_ETCD_KEY
    k8s:
        crt: op://Homelab/Talos/CERTS_K8S_CRT
        key: op://Homelab/Talos/CERTS_K8S_KEY
    k8saggregator:
        crt: op://Homelab/Talos/CERTS_K8SAGGREGATOR_CRT
        key: op://Homelab/Talos/CERTS_K8SAGGREGATOR_KEY
    k8sserviceaccount:
        key: op://Homelab/Talos/CERTS_K8SSERVICEACCOUNT_KEY
    os:
        crt: op://Homelab/Talos/CERTS_OS_CRT
        key: op://Homelab/Talos/CERT_OS_KEY
