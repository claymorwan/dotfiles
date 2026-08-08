{ osConfig, ... }:

let
  inherit (osConfig.globVars)
    terminal
    browser
    discord
    ;
in
{
  imports = [
    ./dms.nix
    ./default-binds.nix
    # ./noctalia.nix
  ];
  programs.niri.settings = {
    binds = {
      # Applications
      "Mod+Return" = {
        action.spawn = terminal;
        hotkey-overlay.title = "Terminal";
      };

      "Mod+W" = {
        action.spawn = browser;
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

      # "Print" = {
      #   action.spawn = [ "dms" "ipc" "call" "quickCapture" "screenshot" "full" "edit" ];
      #   hotkey-overlay.title = "Screenshot (screen)";
      # };
      
      # "Ctrl+Print" = {
      #   action.spawn = [ "dms" "ipc" "call" "quickCapture" "screenshot" "region" "edit" ];
      #   hotkey-overlay.title = "Screenshot (region)";
      # };

      # "Mod+Print" = {
      #   action.spawn = [ "dms" "ipc" "call" "quickCapture" "screenshot" "window" "edit" ];
      #   hotkey-overlay.title = "Screenshot (window)";
      # };

       "Print" = {
         action.spawn = [ "dms" "ipc" "call" "screenCaptureToolbar" "toggle" ];
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
