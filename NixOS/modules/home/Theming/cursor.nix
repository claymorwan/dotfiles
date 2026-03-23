{ pkgs, osConfig, ... }:

{
  home.pointerCursor = {
    enable = true;

    name = osConfig.globVars.mouse_cursor; #"${mouse_cursor}";
    package = pkgs.mouse-cursor;

    hyprcursor = {
      enable = true;
      size = 24;
    };

    gtk.enable = true;
    x11.enable = true;
  };
}
