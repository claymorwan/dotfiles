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
      "Alt, F4, killactive, " # [hidden] Close (Windows)

      # Applications
      "${mainMod}, Return, exec, ${launch_prefix} ${terminal} # Terminal"
      "${mainMod}, W, exec, ${launch_prefix} ${browser}" # Browser
      "${mainMod}, D, exec, ${launch_prefix} equibop" # Discord
      "${mainMod}, S, exec, ${launch_prefix} spotify" # Spotify
      "${mainMod}, E, exec, ${launch_prefix} ${terminal} -e yazi" # file explorer

      # Plugins
      "${mainMod}, C, hyprexpo:expo, toggle"

      # Screenshots
      ", Print, exec, dms screenshot full --stdout | gradia"
      "Ctrl, Print, exec, dms screenshot --stdout | gradia"
      "${mainMod}, Print, exec, dms screenshot window --stdout | gradia"

      # ", Print, exec, hyprshot -z -m output -o ${screenshot_dir} -- gradia"
      # "Ctrl, Print, exec, hyprshot -z -m region -o ${screenshot_dir} -- gradia"
      # "${mainMod}, Print, exec, hyprshot -z -m window -o ${screenshot_dir} -- gradia"

    ];
  };
}
