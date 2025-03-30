#/bin/bash
set -e -u -o pipefail

SECRETS_TEMPLATE_FILE=$1
PATCHES_DIR=$2
MACHINE_CONFIG_TEMPLATE_FILE=$3
CLUSTER=$4
TALOS_VIP=$5

talosctl gen config -t controlplane --force "$CLUSTER" https://"$TALOS_VIP":6443 --with-secrets <( op.exe inject -i "$SECRETS_TEMPLATE_FILE")  --config-patch @<( yq eval-all '. as $item ireduce ({}; . * $item)' $(find "$PATCHES_DIR" -name '*.yaml')) --config-patch @<(cat "$MACHINE_CONFIG_TEMPLATE_FILE" | minijinja-cli --env)  --output -




#talosctl gen config -t controlplane --force {{.CLUSTER}} https://{{.TALOS_VIP}}:6443 --with-secrets <( op.exe inject -i {{.KUBERNETES_DIR}}/{{.CLUSTER}}/provision/patches/secrets.yaml.tpl)  --config-patch @<( yq eval-all '. as $item ireduce ({}; . * $item)' $(find {{.KUBERNETES_DIR}}/{{.CLUSTER}}/provision/patches -name '*.yaml')) --config-patch @<(cat ./kubernetes/production/provision/patches/nodes/{{.IP}}.yaml.j2 | minijinja-cli --env)  --output {{.KUBERNETES_DIR}}/{{.CLUSTER}}/provision/rendered2/controlplane-203apa.yaml
