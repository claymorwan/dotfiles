{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    plugins = [
      pkgs.hyprlandPlugins.hyprscrolling
      pkgs.hyprlandPlugins.hypr-dynamic-cursors
      pkgs.hyprlandPlugins.hyprexpo
    ];
    settings = {
      plugin = {
        dynamic-cursors = {
	  mode = "stretch";
	  ignore_warps = false;

	  hyprcursor = {
            enabled = true;

            nearest = 2;
	  };
	};

	hyprscrolling = {
          column_width = 0.8;
          fullscreen_on_one_column = true;
          focus_fit_method = 1;
          follow_focus = false;
	};

	hyprexpo = {
          columns = 3;
          gap_size = 5;
          bg_col = "rgb(111111)";
          workspace_method = "center current"; # [center/first] [workspace] e.g. first 1 or center m+1

          enable_gesture = true; # laptop touchpad
          gesture_fingers = 3;  # 3 or 4
          gesture_distance = 300; # how far is the "max"
          gesture_positive = true; # positive = swipe down. Negative = swipe up.
	};

	hyprwinwrap = {
          class = "swayimg-bg";
	};

      };
    };
  };
}
