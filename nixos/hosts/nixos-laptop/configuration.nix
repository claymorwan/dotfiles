# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      #./hardware-configuration.nix
      #./../../home
      ./../../modules/system
    ];

  boot.initrd.luks.devices."luks-1cedacd2-a824-4e50-82b4-ebf194c70d2d".device = "/dev/disk/by-uuid/1cedacd2-a824-4e50-82b4-ebf194c70d2d";

  # Enable the KDE Plasma Desktop Environment.
  # services.displayManager.sddm.enable = true;
  # services.desktopManager.plasma6.enable = true;
  
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

}
