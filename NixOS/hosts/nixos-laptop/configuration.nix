# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ inputs, config, pkgs, ... }:

{
  imports = [
    ./../../modules/system
  ];

  boot.initrd.luks.devices."luks-1cedacd2-a824-4e50-82b4-ebf194c70d2d".device = "/dev/disk/by-uuid/1cedacd2-a824-4e50-82b4-ebf194c70d2d";
}
