{ osConfig, ... }:

{
  imports = [
    ./Shells
  ]
  ++ (if osConfig.globVars.enableNiri then [./niri] else [])
  ++ (if osConfig.globVars.enableHyprland then [./hyprland] else [])
  ;
}
