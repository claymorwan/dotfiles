{ pkgs, inputs, ... }:

{
  imports = [
    inputs.archix.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    paru
    fakeroot
  ];
}
