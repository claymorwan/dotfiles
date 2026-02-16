let
  inherit (import ../../../variables)
  enableNiri
  enableHyprland
  ;
in
{
  imports = [
    ./Shells
  ]
  ++ (if enableNiri then [./niri] else [])
  ++ (if enableHyprland then [./hyprland] else [])
  ;
}
