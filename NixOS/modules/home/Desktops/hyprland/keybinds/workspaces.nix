{ ... }:

let
  inherit (import ../../../../../variables/variables.nix)
    mainMod
    ;
in
{
  wayland.windowManager.hyprland.settings = {
    bind = [
      # Go to workspace -1/+1
      "${mainMod}, mouse_down, workspace, -1"
      "${mainMod}, mouse_up, workspace, +1"

      # Go to workspace group -1/+1
      "Ctrl+${mainMod}, mouse_down, workspace, -10"
      "Ctrl+${mainMod}, mouse_up, workspace, +10"

      # Move window to workspace -1/+1
      "${mainMod}+Alt, mouse_down, movetoworkspace, -1"
      "${mainMod}+Alt, mouse_up, movetoworkspace, +1"

      # Move window to/from special workspace
      "Ctrl+${mainMod}+Shift, up, movetoworkspace, special:special"
      "Ctrl+${mainMod}+Shift, down, movetoworkspace, e+0"
      "${mainMod}+Alt, S, movetoworkspace, special:special"

      # Window groups
      "${mainMod}, Comma, togglegroup"
      "${mainMod}+Shift, Comma, lockactivegroup, toggle"

      # Window actions
      "${mainMod}, left, movefocus, l"
      "${mainMod}, right, movefocus, r"
      "${mainMod}, up, movefocus, u"
      "${mainMod}, down, movefocus, d"
      "${mainMod}+Shift, left, movewindow, l"
      "${mainMod}+Shift, right, movewindow, r"
      "${mainMod}+Shift, up, movewindow, u"
      "${mainMod}+Shift, down, movewindow, d"
      "Ctrl+${mainMod}, Backslash, centerwindow, 1"
      "Ctrl+${mainMod}+Alt, Backslash, resizeactive, exact 55% 70%"
      "Ctrl+${mainMod}+Alt, Backslash, centerwindow, 1"
      "${mainMod}+Alt, Backslash, exec, caelestia pip" # Move window to picture-in-picture mode
      "${mainMod}, P, pin"
      "${mainMod}, F, fullscreen, 0"
      "${mainMod}+Alt, F, fullscreen, 1" # Fullscreen with borders
      "${mainMod}+Alt, Space, togglefloating,"
      "${mainMod}, Q, killactive,"
    ];
    binde = [
      # Go to workspace -1/+1
      "Ctrl+${mainMod}, left, workspace, -1"
      "${mainMod}, Page_Up, workspace, -1"
      "Ctrl+${mainMod}, right, workspace, +1"
      "${mainMod}, Page_Down, workspace, +1"

      # Move window to workspace -1/+1
      "${mainMod}+Alt, Page_Up, movetoworkspace, -1"
      "${mainMod}+Alt, Page_Down, movetoworkspace, +1"
      "Ctrl+${mainMod}+Shift, right, movetoworkspace, +1"
      "Ctrl+${mainMod}+Shift, left, movetoworkspace, -1"

      # Window groups
      "Alt, Tab, changegroupactive, f"
      "Shift+Alt, Tab, changegroupactive, b"

      # Window actions
      "${mainMod}, Minus, splitratio, -0.1"
      "${mainMod}, Equal, splitratio, 0.1"
    ];
    bindm = [
      "${mainMod}, mouse:272, movewindow"
      "${mainMod}, Z, movewindow"
      "${mainMod}, mouse:273, resizewindow"
      "${mainMod} + ALT, X, resizewindow"
    ];
  };
}
