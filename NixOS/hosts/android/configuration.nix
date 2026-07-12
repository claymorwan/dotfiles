{ inputs, ... }:

{
  imports = [
    inputs.nixos-avf.nixosModules.avf
  ];
}
