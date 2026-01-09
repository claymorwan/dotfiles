{ inputs, pkgs, ... }:

{
  import = [
    inputs.niri.homeModules.niri
  ];

  programs = {
    niri = {
      enable = true;

      package = pkgs.niri;
    };
  };
}
