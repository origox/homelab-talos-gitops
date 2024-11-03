# Talos Linux


## [Upgrading Talos Linux](https://www.talos.dev/v1.8/talos-guides/upgrading-talos/)
Follow recommendation and upgrade node by node. Start with control nodes and then clients.

```bash
# tmux pane 1 - follow node versions
k get nodes -o wide -w

# tmux pane 2 - follow kernal for spec. node
talosctl dmesg -f -n A.B.C.D

# tmux pane 3 - start upgrade 
task talos:upgrade-node HOSTNAME=A.B.C.D
```



## Upgrade Talos Kubernetes

