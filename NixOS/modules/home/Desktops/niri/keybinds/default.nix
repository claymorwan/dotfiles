{ osConfig, ... }:

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
        action.spawn = osConfig.globVars.terminal;
        hotkey-overlay.title = "Terminal";
      };

      "Mod+W" = {
        action.spawn = osConfig.globVars.browser;
        hotkey-overlay.title = "Browser";
      };

      "Mod+D" = {
        action.spawn-sh = osConfig.globVars.discord;
        hotkey-overlay.title = "Discord";
      };

      "Mod+Alt+S" = {
        action.spawn = "spotify";
        hotkey-overlay.title ="Spotify";
      };

      "Mod+E" = {
        action.spawn = [ osConfig.globVars.terminal "-e" "yazi" ];
        hotkey-overlay.title = "File explorer";
      };

      "Mod+Shift+P" = {
        action.spawn = [ "nirius" "toggle-follow-mode" ];
        hotkey-overlay.title = "Pin window";
      };

      "Print" = {
        action.spawn = [ "dms" "ipc" "call" "quickCapture" "screenshot" "full" ];
        hotkey-overlay.title = "Screenshot (screen)";
      };
      
      "Ctrl+Print" = {
        action.spawn = [ "dms" "ipc" "call" "quickCapture" "screenshot" "region" ];
        hotkey-overlay.title = "Screenshot (region)";
      };

      "Mod+Print" = {
        action.spawn = [ "dms" "ipc" "call" "quickCapture" "screenshot" "window" ];
        hotkey-overlay.title = "Screenshot (window)";
      };

      # "Print" = {
      #   action.spawn-sh = "dms screenshot full --stdout | gradia";
      #   hotkey-overlay.title = "Screenshot (screen)";
      # };
      #
      # "Ctrl+Print" = {
      #   action.spawn-sh = "dms screenshot --stdout | gradia";
      #   hotkey-overlay.title = "Screenshot (region)";
      # };
      #
      # "Mod+Print" = {
      #   action.spawn-sh = "dms screenshot window --stdout | gradia";
      #   hotkey-overlay.title = "Screenshot (window)";
      # };

    };
  };
}
