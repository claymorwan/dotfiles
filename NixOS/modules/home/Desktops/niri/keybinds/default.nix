let
  inherit (import ../../../../../variables)
  terminal
  browser
  discord
  ;
in 
{
  imports = [
    ./dms.nix
    ./default-binds.nix
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
        action.spawn-sh = discord;
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

      "Print" = {
        action.spawn-sh = "dms screenshot full --stdout | gradia";
        hotkey-overlay.title = "Screenshot (screen)";
      };
      
      "Ctrl+Print" = {
        action.spawn-sh = "dms screenshot --stdout | gradia";
        hotkey-overlay.title = "Screenshot (region)";
      };

      "Mod+Print" = {
        action.spawn-sh = "dms screenshot window --stdout | gradia";
        hotkey-overlay.title = "Screenshot (window)";
      };
    };
  };
}
