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
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user and add to Docker usergroup.
    packages = with pkgs; [
      tree
      docker
    ];
    initialPassword = "testpw";
    createHome = true; # Automatically create home directory
    shell = "/run/current-system/sw/bin/bash"; # Specify the shell path
  };


  networking.hostName = "docker-nixos";
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  services = {
    openssh = {
      enable = true;
    };
  };
  # Rootless Docker, VM issues
  virtualisation.docker = {
    enable = true;
    rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };
  # Enable automatic login for the specified user using getty
  services.getty.autologinUser = "alice";
  system.stateVersion = "23.11";
}
