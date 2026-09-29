{ inputs, ... }:

{
  imports = [
    inputs.noctalia.homeModules.default
    ./plugins.nix
  ];

  programs.noctalia-shell = {
    enable = true;

    systemd.enable = true;
  };
}
