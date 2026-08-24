{ lib, osConfig, ... }:

{
  imports = [
    ./Shells
  ]
  ++ (lib.optional osConfig.programs.niri.enable ./niri)
  ++ (lib.optional osConfig.programs.hyprland.enable ./hyprland)
  ;
}
