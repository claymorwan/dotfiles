let
  inherit (import ../../../../../variables)
    mainMod
    terminal
    browser
    screenshot_dir
    ;
in
{

  imports = [
    ./dms.nix
    ./hyprscrolling.nix
    ./workspaces.nix
  ];

  wayland.windowManager.hyprland.settings = {
    "$mainMod" = mainMod;
    exec = "hyprctl dispatch submap global";
    submap = "global";

    bind = [
      "Alt, F4, killactive, # [hidden]" # Close (Windows)
      # "$mainMod, Space, exec, hyprctl switchxkblayout # Switch keyboard layout"

      # Applications
      "$mainMod, Return, exec, ${terminal} # Terminal"
      "$mainMod, W, exec, ${browser} # Browser"
      "$mainMod, D, exec, equibop # Discord"
      "$mainMod, S, exec, spotify # Spotify"
      "$mainMod, E, exec, ${terminal} -e yazi # File explorer"

      # Plugins
      "$mainMod, C, hyprexpo:expo, toggle # Hyprexpo"

      # Screenshots
      ", Print, exec, dms screenshot full --stdout | gradia # Screenshot (full)"
      "Ctrl, Print, exec, dms screenshot --stdout | gradia # Screenshot (region)"
      "$mainMod, Print, exec, dms screenshot window --stdout | gradia # Screenshot (window)"

      # ", Print, exec, hyprshot -z -m output -o ${screenshot_dir} -- gradia"
      # "Ctrl, Print, exec, hyprshot -z -m region -o ${screenshot_dir} -- gradia"
      # "$mainMod, Print, exec, hyprshot -z -m window -o ${screenshot_dir} -- gradia"

    ];
  };
}
