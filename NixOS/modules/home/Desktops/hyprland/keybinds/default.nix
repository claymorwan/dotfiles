{ osConfig, ... }:

{

  imports = [
    ./dms.nix
    ./hyprscrolling.nix
    ./workspaces.nix
  ];

  wayland.windowManager.hyprland.settings = {
    "$osConfig.globVars.mainMod" = osConfig.globVars.mainMod;
    exec = "hyprctl dispatch submap global";
    submap = "global";

    bind = [
      "Alt, F4, killactive, # [hidden]" # Close (Windows)
      # "$osConfig.globVars.mainMod, Space, exec, hyprctl switchxkblayout # Switch keyboard layout"

      # Applications
      "$osConfig.globVars.mainMod, Return, exec, ${osConfig.globVars.terminal} # osConfig.globVars.terminal"
      "$osConfig.globVars.mainMod, W, exec, ${osConfig.globVars.browser} # osConfig.globVars.browser"
      "$osConfig.globVars.mainMod, D, exec, equibop # Discord"
      "$osConfig.globVars.mainMod, S, exec, spotify # Spotify"
      "$osConfig.globVars.mainMod, E, exec, ${osConfig.globVars.terminal} -e yazi # File explorer"

      # Plugins
      "$osConfig.globVars.mainMod, C, hyprexpo:expo, toggle # Hyprexpo"

      # Screenshots
      ", Print, exec, dms screenshot full --stdout | gradia # Screenshot (full)"
      "Ctrl, Print, exec, dms screenshot --stdout | gradia # Screenshot (region)"
      "$osConfig.globVars.mainMod, Print, exec, dms screenshot window --stdout | gradia # Screenshot (window)"

      # ", Print, exec, hyprshot -z -m output -o ${osConfig.globVars.screenshot_dir} -- gradia"
      # "Ctrl, Print, exec, hyprshot -z -m region -o ${osConfig.globVars.screenshot_dir} -- gradia"
      # "$osConfig.globVars.mainMod, Print, exec, hyprshot -z -m window -o ${osConfig.globVars.screenshot_dir} -- gradia"

    ];
  };
}
