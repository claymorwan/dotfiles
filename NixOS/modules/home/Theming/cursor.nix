{ pkgs, osConfig, ... }:

{
  home.pointerCursor = {
    enable = true;
    name = osConfig.globVars.mouseCursor.name;
    size = osConfig.globVars.mouseCursor.size;
    package = pkgs.mouse-cursor;
    hyprcursor.enable = osConfig.globVars.enableHyprland;
    gtk.enable = true;
    x11.enable = true;
  };
}
