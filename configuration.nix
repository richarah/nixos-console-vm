{ config, pkgs, ... }:
{ 
  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Remove X server and graphical desktop manager
  services.xserver.enable = false;
  services.xserver.displayManager.gdm.enable = false;
  services.xserver.desktopManager.gnome.enable = false;

  # Set hostname
  networking.hostName = "nixos-console-vm";

  # Configure the system locale
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Enable the NixOS module system
  imports = [
    <nixpkgs/nixos/modules/installer/cd-dvd/channel.nix>
  ];

  # Define the system services
  services = {
    # Enable the OpenSSH server
    openssh = {
      enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    python38
  ];
  
  system.stateVersion = "23.11";
}
