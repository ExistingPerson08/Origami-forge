#!/usr/bin/env bash
set -eoux pipefail

# Force install Firefox and remove Zen to make anaconda work
dnf remove -y zen-browser
dnf install -y firefox

# Disable services not needed in live environment
systemctl disable rpm-ostree-countme.service
systemctl disable bootloader-update.service

# Install Anaconda for installation
dnf install -y anaconda-live libblockdev-btrfs
