#!/bin/sh
# Bad practice, but better than a system-wide change
nix-build '<nixpkgs/nixos>' -A vm \
-I nixpkgs=channel:nixos-23.11 \
-I nixos-config=./configuration.nix \
--option sandbox false
