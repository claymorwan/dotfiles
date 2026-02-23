{ inputs, pkgs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./plugins.nix
  ];

  programs.noctalia-shell = {
    # enable = true;
    package = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      quickshell = inputs.quickshell.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };

    systemd.enable = true;
  };
}
