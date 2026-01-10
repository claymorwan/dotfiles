let
  inherit (import ../../../../variables/variables.nix)
  terminal
  browser
  ;
in 
{
  imports = [
    ./keybinds/dms.nix
    ./keybinds/default-binds.nix
  ];
  programs.niri.settings = {
    binds = {
      # Applications
      "Mod+Return" = {
        action.spawn = terminal;
        hotkey-overlay.title = "Terminal";
      };

      "Mod+W" = {
        action.spawn-sh = browser;
        hotkey-overlay.title = "Browser";
      };

      "Mod+D" = {
        action.spawn = "equibop";
        hotkey-overlay.title = "Discord";
      };

      "Mod+Alt+S" = {
        action.spawn = "spotify";
        hotkey-overlay.title ="Spotify";
      };

      "Mod+E" = {
        action.spawn = [ terminal "-e" "yazi" ];
        hotkey-overlay.title = "File explorer";
      };
      # "Print".action.spawn = [ "dms" "screenshot" "full" "--stdout" "| gradia" ];
      # "Ctrl+Print".action.spawn = [ "dms" "screenshot" "--stdout" "| gradia" ];
      # "Mod+Print".action.spawn = [ "dms" "screenshot" "window" "--stdout" "| gradia" ];
    };
  };
}
