{ ... }:

let
  inherit (import ./../../../variables/variables.nix)
    mainMod
    launch_prefix
    terminal
    browser
    screenshot_dir
    ;
in
{

  imports = [
    ./keybinds/dms.nix
    ./keybinds/hyprscrolling.nix
    ./keybinds/workspaces.nix
  ];
  wayland.windowManager.hyprland.settings = {
    exec = "hyprctl dispatch submap global";
    submap = "global";

    bind = [
      "Alt, F4, killactive, # [hidden]" # Close (Windows)
      "${mainMod}, Space, exec, hyprctl switchxkblayout # Switch keyboard layout"

      # Applications
      "${mainMod}, Return, exec, ${launch_prefix} ${terminal} # Terminal"
      "${mainMod}, W, exec, ${launch_prefix} ${browser} # Browser"
      "${mainMod}, D, exec, ${launch_prefix} equibop # Discord"
      "${mainMod}, S, exec, ${launch_prefix} spotify # Spotify"
      "${mainMod}, E, exec, ${launch_prefix} ${terminal} -e yazi # File explorer"

      # Plugins
      "${mainMod}, C, hyprexpo:expo, toggle # Hyprexpo"

      # Screenshots
      ", Print, exec, dms screenshot full --stdout | gradia # Screenshot (full)"
      "Ctrl, Print, exec, dms screenshot --stdout | gradia # Screenshot (region)"
      "${mainMod}, Print, exec, dms screenshot window --stdout | gradia # Screenshot (window)"

      # ", Print, exec, hyprshot -z -m output -o ${screenshot_dir} -- gradia"
      # "Ctrl, Print, exec, hyprshot -z -m region -o ${screenshot_dir} -- gradia"
      # "${mainMod}, Print, exec, hyprshot -z -m window -o ${screenshot_dir} -- gradia"

    ];
  };
}
