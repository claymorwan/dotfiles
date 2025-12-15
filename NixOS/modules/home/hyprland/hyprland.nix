{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpicker
    hyprshot
    # hyprpwcenter
  ];

  systemd.user.targets.hyprland-session.Unit.Wants = [
    "xdg-desktop-autostart.target"
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    systemd = {
      enable = true;
      enableXdgAutostart = true;
      variables = [ "--all" ];
    };
    xwayland = {
      enable = true;
    };

    settings = {

      monitor = [
        ", preferred, auto, 1"
        "DP-1,1920x1080@60.0,1920x0,1.0"
        "HDMI-A-1,1920x1080@60.0,0x0,1.0"
      ];

      general = {
        layout = "scrolling";
        gaps_in = 4;
        gaps_out = 15;
        gaps_workspaces = 50;

        border_size = 2;
        "col.active_border" = "$accent";
        "col.inactive_border" = "$surface0";
        resize_on_border = true;

        no_focus_fallback = true;
        allow_tearing = true; # This just allows the `immediate` window rule to work

        snap = {
          enabled = true;
          window_gap = 4;
          monitor_gap = 5;
          respect_gaps = true;
        };
      };

      input = {
        kb_layout = "fr";
        kb_options = "grp:win_space_toggle";
        numlock_by_default = true;
        repeat_delay = 250;
        repeat_rate = 35;

        follow_mouse = 1;
        off_window_axis_events = 2;

        touchpad = {
          natural_scroll = true;
          disable_while_typing = true;
          clickfinger_behavior = true;
          scroll_factor = 0.5;
        };
      };

      binds = {
        scroll_event_delay = 0;
        hide_special_on_workspace_change = true;
      };

      gesture = [
        "3, swipe, move"
        "4, horizontal, workspace"
        "4, pinch, float"
        "4, up, dispatcher, exec, dms ipc call hypr closeOverview"
        "4, down, dispatcher, exec, dms ipc call hypr openOverview"
      ];

      gestures = {
        workspace_swipe_distance = 700;
        workspace_swipe_cancel_ratio = 0.2;
        workspace_swipe_min_speed_to_force = 5;
        workspace_swipe_direction_lock = true;
        workspace_swipe_direction_lock_threshold = 10;
        workspace_swipe_create_new = true;
      };

      cursor = {
        zoom_factor = 1;
        zoom_rigid = false;
        # hotspot_padding = 1;
      };

      misc = {
        disable_hyprland_logo = false;
        disable_splash_rendering = false;
        vfr = 1;
        vrr = 1;
        mouse_move_enables_dpms = true;
        key_press_enables_dpms = true;
        animate_manual_resizes = true;
        animate_mouse_windowdragging = false;
        enable_swallow = false;
        swallow_regex = "(ghostty|foot|kitty|allacritty|Alacritty)";
        new_window_takes_over_fullscreen = 2;
        session_lock_xray = true;
        initial_workspace_tracking = false;
        focus_on_activate = true;
      };
    };
  };
}
