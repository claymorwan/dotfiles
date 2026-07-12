{ inputs, lib, ... }:

{
  imports = [
    inputs.nixos-avf.nixosModules.avf
  ];

  nixpkgs.hostPlatform = lib.mkDefault "aarch64-linux";
}
