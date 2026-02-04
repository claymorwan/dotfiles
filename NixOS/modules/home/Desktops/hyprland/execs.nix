{ ... }:

let
  inherit (import ../../../../variables)
    mouse_cursor
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # Cursors
      # "hyprctl setcursor ${mouse_cursor}-H 24"
      # "gsettings set org.gnome.desktop.interface cursor-theme ${mouse_cursor}-X"
 
      # Autostart
      "equibop --start-minimized"
      "steam -silent"
    ];
  };
}
