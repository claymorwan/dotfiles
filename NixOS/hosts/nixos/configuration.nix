# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports = [
      ./../../modules/system
    ];

  # nixpkgs.config.allowBroken = true;
  boot.initrd.luks.devices."luks-9f016025-97b5-4c03-abea-d3ed5b8ad2b4".device = "/dev/disk/by-uuid/9f016025-97b5-4c03-abea-d3ed5b8ad2b4";
}
