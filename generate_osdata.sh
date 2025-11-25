#!/bin/sh

HOSTNAME_VAL="$(hostname)"
ARCH="$(uname -m)"
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
SYSTEM_VAL="${ARCH}-${OS}"
USERNAME_VAL="$(whoami)"

if [ $OS = "linux" ]; then
    MACHINE_ID="$(cat /etc/machine-id)"
else
    MACHINE_ID="$(system_profiler SPHardwareDataType | grep UUID | awk 'NF>1{print $NF}')"
fi

cp /etc/nixos/hardware-configuration.nix machines/${MACHINE_ID}.nix

cat > .osdata <<EOF
HOSTNAME="${HOSTNAME_VAL}"
SYSTEM="${SYSTEM_VAL}"
USERNAME="${USERNAME_VAL}"
MACHINE_ID="${MACHINE_ID}"
EOF
