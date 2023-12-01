{ config, pkgs, ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Remove X server and graphical desktop manager
  services.xserver.enable = false;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = false;

  # User configuration with automatic login
  users.users.alice = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
    initialPassword = "testpw";
    createHome = true; # Automatically create home directory
    shell = "/run/current-system/sw/bin/bash"; # Specify the shell path
  };

  # Enable automatic login for the specified user using getty
  services.getty.autologinUser = "alice";
  system.stateVersion = "23.11";
}
