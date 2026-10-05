{ lib, pkgs, host, ... }:

{
  imports = [
    ./mimes.nix
  ];
  xdg = {
    autostart = {
      enable = true;
      readOnly = true;

      entries = [
        (lib.mkIf (host == "nixos") "${pkgs.gpu-screen-recorder-ui}/share/applications/gpu-screen-recorder.desktop")
      ];
    };
    
    configFile."xdg-desktop-portal-termfilechooser/config" = {
      # enable = false;
      text = ''
        [filechooser]
        cmd=${pkgs.xdg-desktop-portal-termfilechooser}/share/xdg-desktop-portal-termfilechooser/yazi-wrapper.sh
        default_dir=$HOME
        env=TERMCMD='ghostty --title="terminal-filechooser" -e'
        open_mode=suggested
        save_mode=last
      '';
    };
  };
}
