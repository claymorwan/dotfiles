{ pkgs, config, ... }:

let
  inherit (import ./../../../variables)
    mouse_cursor
    ;
in
{
  home.pointerCursor = {
    enable = true;

    name = config.globVars.mouse_cursor; #"${mouse_cursor}";
    package = pkgs.mouse-cursor;

    hyprcursor = {
      enable = true;
      size = 24;
    };

    gtk.enable = true;
    x11.enable = true;
  };
}
