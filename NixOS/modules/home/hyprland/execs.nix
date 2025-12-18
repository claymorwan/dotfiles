{ ... }:

let
  inherit (import ./../../../variables/variables.nix)
    mouse_cursor
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      # Core components (authentication, lock screen)
      "gnome-keyring-daemon --start --components=secrets"

      # Clipboard history
      # "bash -c 'wl-paste --watch cliphist store &'"

      # Cursors
      # "hyprctl setcursor ${mouse_cursor}-H 24"
      # "gsettings set org.gnome.desktop.interface cursor-theme ${mouse_cursor}-X"

      # Location provider and night light
      # "/usr/lib/geoclue-2.0/demos/agent"
      # "sleep 1 && gammastep"

      # Idle inhibit when audio playing
      # "sway-audio-idle-inhibit --ignore-source-outputs cava"

      # Forward bluetooth media commands to MPRIS
      "mpris-proxy"

      # Autostart
      "sleep 3; app2unit -- equibop --start-minimized"
    ];
  };
}
