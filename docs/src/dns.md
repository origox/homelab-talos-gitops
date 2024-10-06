# DNS

Use ExternalDNS with Unifi provider to make kubernetes services discoverable.

- [ExternalDNS](https://github.com/kubernetes-sigs/external-dns)
- [ExternalDNS Webhook Provider for UniFi](https://github.com/kashalls/external-dns-unifi-webhook) <br>
---
## NOTE: Chech this page how to handle external-dns and traefik ingress routes.
- [traefik-proxy](https://github.com/kubernetes-sigs/external-dns/blob/cda94ebed99eca67a4f5be2198eea09f9162ef52/docs/sources/traefik-proxy.md#L4)

## Instruction
1. Update external dns helm deployment
```bash
# From helm files
# add source=traefik-proxy
#disable traefik-legacy to avoid ext dns dies not finding old paths...
# not sure if this is needed,  but added crd to sources array 
extraArgs:
      - --ignore-ingress-tls-spec
      - --traefik-disable-legacy
      - --source=traefik-proxy
    policy: sync
    sources: ["service","ingress", "crd"]
```

2. ClusterRole need to be edit
```bash
# should have entries for traefik.io...
- apiGroups: ["traefik.containo.us","traefik.io"]
  resources: ["ingressroutes", "ingressroutetcps", "ingressrouteudps"]
  verbs: ["get","watch","list"]
```

3. Annotate all ingress routes i.e. target shall point to traefik service
```bash
annotations:
    external-dns.alpha.kubernetes.io/target: traefikqqq.${SECRET_CLUSTER_LOCAL_DOMAIN}

```

4. Traefik hemlm release, deployment need to annotated
```bash
service:
      annotations:
        external-dns.alpha.kubernetes.io/hostname: traefikqqq.${SECRET_CLUSTER_LOCAL_DOMAIN}
        external-dns.alpha.kubernetes.io/owner-id: main
        lbipam.cilium.io/ips: 172.16.32.99
```

5. Traefik hostname and ip was pre configured in router
SEEMS NOT NEEDED, EXTERNAL-DNS CREATES TRAEFIK ENTRY.

---
## Fault finding

```bash
# List external-dns 
k -n network get all 

# Chech external-dns log
 k -n network logs -f pods/external-dns-unifi-85678f4b86-cq7x7

# Check/Edit cluster role
k edit clusterroles.rbac.authorization.k8s.io external-dns-unifi
```