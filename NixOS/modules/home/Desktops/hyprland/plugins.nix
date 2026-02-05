{ inputs, pkgs, ... }:

let
  inherit (import ../../../../variables)
    font_family
    ;
in
{
  wayland.windowManager.hyprland = {
    plugins = with pkgs.hyprlandPlugins; [
      (pkgs.callPackage ../../../../pkgs/hyprscrolling { })
      hypr-dynamic-cursors
      hyprexpo
      # hyprbars
    ];
    settings = {
      plugin = {
        dynamic-cursors = {
          mode = "tilt";
          ignore_warps = false;

          hyprcursor = {
            enabled = true;
            nearest = 2;
          };
        };

        hyprscrolling = {
          column_width = 0.66666;
          fullscreen_on_one_column = true;
          focus_fit_method = 1;
          follow_focus = true;
        };

        hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "$mantle";
          workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

          enable_gesture = true; # laptop touchpad
          gesture_fingers = 3; # 3 or 4
          gesture_distance = 300; # how far is the "max"
          gesture_positive = true; # positive = swipe down. Negative = swipe up.
        };

        hyprwinwrap = {
          class = "swayimg-bg";
        };

        hyprbars = {
          bar_text_font = font_family;
          bar_height = 30;
          bar_padding = 15;

          bar_button_padding = 5;
          bar_precedence_over_border = true;
          bar_part_of_window = true;

          bar_color = "$base";
          "col.text" = "$text";

          "$button_size" = 15;
          hyprbars-button = [
            "$red, $button_size, 󰖭, hyprctl dispatch killactive, $crust"
            "$yellow, $button_size, 󰖯, hyprctl dispatch togglefloating, $crust"
            "$green, $button_size, 󰖰, hyprctl dispatch movetoworkspacesilent special, $crust"
          ];
        };
      };
    };
  };
}
