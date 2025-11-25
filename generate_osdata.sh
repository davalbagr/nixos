#!/bin/sh

HOSTNAME_VAL="$(hostname)"
ARCH="$(uname -m)"
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
SYSTEM_VAL="${ARCH}-${OS}"
USERNAME_VAL="$(whoami)"

if [ $OS = "linux" ]; then
    MACHINE_ID="$(cat /etc/machine-id | sha256sum | head -c 64)"
else
    MACHINE_ID="$(system_profiler SPHardwareDataType | grep UUID | awk 'NF>1{print $NF}' | sha256sum | head -c 64)"
fi

cp /etc/nixos/hardware-configuration.nix machines/${MACHINE_ID}.nix

cat > .osdata <<EOF
hostname="${HOSTNAME_VAL}"
system="${SYSTEM_VAL}"
username="${USERNAME_VAL}"
machine="${MACHINE_ID}"
EOF
