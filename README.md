# nixos-console-vm

## What is this?

A somewhat minimal NixOS QEMU VM with the requisite settings to use the host console, as opposed to creating its own VGA output window.

**Full disclosure: At the time of writing, I am still getting the hang of NixOS and the Nix ecosystem, so this is almost certainly suboptimal.**

## What is it for?

Saving Nix newcomers a few hours of banging their heads against the wall, wondering why their headless NixOS VMs aren't headless-ing properly.

Having nix-build put together a VM to this specification proved less intuitive than expected (even the "headless" profile pops open its own QEMU window, and this does not appear to be editable within the Nix configuration).
