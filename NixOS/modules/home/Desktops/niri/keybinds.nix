let
  inherit (import ../../../../variables/variables.nix)
  terminal
  browser
  ;
in 
{
  imports = [
    ./keybinds/dms.nix
  ];
  programs.niri.settings = {
    binds = {
      # Applications
      "Mod+Return".action.spawn = terminal;
      "Mod+W".action.spawn = browser;
      "Mod+D".action.spawn = "equibop";
      "Mod+S".action.spawn = "spotify";
      "Mod+E".action.spawn = [ terminal "-e" "yazi" ];

      "Print".action.spawn = [ "dms" "screenshot" "full" "--stdout" "|" "gradia" ];
      "Ctrl+Print".action.spawn = [ "dms" "screenshot" "--stdout" "|" "gradia" ];
      "Mod+Print".action.spawn = [ "dms" "screenshot" "window" "--stdout" "|" "gradia" ];
    };
  };
}
