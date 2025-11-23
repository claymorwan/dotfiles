{ ... }:

let
  inherit
    (import ./../../../variables/variables.nix)
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
      "${mainMod}, Return, exec, ${launch_prefix} ${terminal}" # Terminal
      "${mainMod}, W, exec, ${launch_prefix} ${browser}" # Browser
      "${mainMod}, D, exec, ${launch_prefix} equibop" # Discord
      "${mainMod}, E, exec, ${launch_prefix} ${terminal} -e yazi" # file explorer
      
      # Plugins
      "${mainMod}, C, hyprexpo:expo, toggle"

      # Screenshots
      ", Print, exec, hyprshot -z -m output -o ${screenshot_dir} -- gradia"
      "Ctrl, Print, exec, hyprshot -z -m output -o ${screenshot_dir} -- gradia"
      "${mainMod}, Print, exec, hyprshot -z -m output -o ${screenshot_dir} -- gradia"

     ];
   };
}
