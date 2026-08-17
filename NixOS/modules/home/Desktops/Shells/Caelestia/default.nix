{ inputs, pkgs, ... }:

{
  imports = [
    inputs.caelestia.homeManagerModules.default
  ];

  programs.caelestia = {
    enable = true;
    # package = inputs.caelestia.packages.${pkgs.stdenv.hostPlatform.system}.with-cli.override {
    #   quickshell = pkgs.quickshell;
    # };

    cli.enable = true;
  };
}
