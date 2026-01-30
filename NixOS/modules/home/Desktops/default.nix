let
  inherit (import ../../../variables)
  enableNiri
  enableHyprland
  ;
in
{
  imports = []
  ++ (if enableNiri then [./niri] else [])
  ++ (if enableHyprland then [./hyprland] else [])
  ;
}
