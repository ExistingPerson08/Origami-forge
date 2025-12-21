#!/usr/bin/env bash
set -eoux pipefail

# Force install Firefox and remove Zen to make anaconda work
dnf remove -y zen-browser
dnf install -y firefox

# Remove uneeded packages to save space
dnf remove -y oru topgrade distrobox cowsay cmatrix cbonsai tty-clock lazygit fish

# Remove cachy kernel - it don't work in live iso
dnf copr remove -y bieszczaders/kernel-cachyos-lto

dnf remove -y kernel-cachyos-lto
dnf install -y kernel kernel-core

# Disable services not needed in live environment
systemctl disable rpm-ostree-countme.service
systemctl disable bootloader-update.service

# Install Anaconda for installation
dnf install -y anaconda-live libblockdev-btrfs
