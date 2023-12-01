#!/bin/sh
# TODO: move to config
export QEMU_OPTS="-nographic -serial mon:stdio" QEMU_KERNEL_PARAMS=console=ttyS0 ; ./result/bin/run-docker-nixos-vm
