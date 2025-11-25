#!/bin/sh

HOSTNAME_VAL="$(hostname)"
ARCH="$(uname -m)"
OS="$(uname -s | tr '[:upper:]' '[:lower:]')"
SYSTEM_VAL="${ARCH}-${OS}"
USERNAME_VAL="$(whoami)"

printf "Enter the machine name: "
read USER_SYSTEM

cp /etc/nixos/hardware-configuration.nix machines/${USER_SYSTEM}.nix

cat > .osdata <<EOF
HOSTNAME="${HOSTNAME_VAL}"
SYSTEM="${SYSTEM_VAL}"
USERNAME="${USERNAME_VAL}"
USER_SYSTEM="${USER_SYSTEM}"
EOF
