# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{
  inputs,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./../../modules/system
  ];

  boot.initrd.luks.devices."luks-12c9cc5b-e166-4dbe-b61c-a28cc58dc4a6".device =
    "/dev/disk/by-uuid/12c9cc5b-e166-4dbe-b61c-a28cc58dc4a6";
}
