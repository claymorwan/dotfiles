{ pkgs, ... }:

{
  imports = [
    # ./termfilepickers.nix
  ];
  xdg = {
    enable = true;

    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser
        xdg-desktop-portal-gtk
      ];
      # configPackages = [ pkgs.hyprland ];
      config = {
        common = {
          "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
        };

        hyprland = {
          default = [
            "hyprland"
            "gtk"
          ];
          "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
        };
      };
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
    # configFile = {
    #   "xdg-desktop-portal-termfilechooser/config" = {
    #     force = true;
    #     text = ''
    #       [filechooser]
    #       cmd=yazi-wrapper.sh
    #       default_dir=$HOME
    #       env=TERMCMD=ghostty --title="terminal-filechooser" -e
    #       open_mode = suggested
    #       save_mode = last
    #     '';
    #   };
    #
    #   "xdg-desktop-portal-termfilechooser/yazi-wrapper.sh" = {
    #     source = ./yazi-wrapper.sh;
    #   };
    # };
  };
}
