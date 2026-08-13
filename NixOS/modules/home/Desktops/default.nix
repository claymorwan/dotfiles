{ osConfig, ... }:

{
  imports = [
    ./Shells
  ]
  ++ (if osConfig.programs.niri.enable then [./niri] else [])
  ++ (if osConfig.programs.hyprland.enable then [./hyprland] else [])
  ;
}
