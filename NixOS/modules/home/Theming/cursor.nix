{ pkgs, osConfig, ... }:

{
  home.pointerCursor = {
    enable = true;

    name = osConfig.globVars.mouseCursor.name;
    package = pkgs.mouse-cursor;

    hyprcursor = {
      enable = true;
      size = osConfig.globVars.mouseCursor.size;
    };

    gtk.enable = true;
    x11.enable = true;
  };
}
