#!/bin/sh
# TODO: move to config
export QEMU_OPTS="-nographic -serial mon:stdio -m 8G -smp $(nproc)" QEMU_KERNEL_PARAMS=console=ttyS0 ; ./result/bin/run-nixos-vm
