#!/usr/bin/env bash
set -eoux pipefail

# Remove packages to save space


# Disable services not needed in live environment
systemctl disable rpm-ostree-countme.service
systemctl disable bootloader-update.service

# Install Anaconda for installation
dnf install -y anaconda-live libblockdev-btrfs
