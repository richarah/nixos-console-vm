#!/bin/sh
# Ugly, but there doesn't appear to be a way to do this in config.
export QEMU_OPTS="-nographic -serial mon:stdio" QEMU_KERNEL_PARAMS=console=ttyS0 ; ./result/bin/run-docker-nixos-vm

