{ pkgs, ... }:

{
  xdg = {
    enable = true;

    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser
      ];
      # configPackages = [ pkgs.hyprland ];
    };
  };

  xdg.portal.config = { 
    common = {
      "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
    };
    hyprland = {
      default = [
        "hyprland"
        "gtk"
      ];
    "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
    };
  };

  xdg.configFile = {
    "xdg-desktop-portal-termfilechooser/config" = {
      force = true;
      text = ''
        [filechooser]
        cmd=yazi-wrapper.sh
        default_dir=$HOME
        env=TERMCMD=ghostty --title="terminal-filechooser" -e
        open_mode = suggested
        save_mode = last
      '';
    };

    "xdg-desktop-portal-termfilechooser/yazi-wrapper.sh" = {
      source = ./yazi-wrapper.sh;
    };
  };

  # xdg.dataFile."sounds/UNDERTUNE" = {
  #   recursive = true;
  #   source = pkgs.fetchzip {
  #     url = "https://ocs-dl.fra1.cdn.digitaloceanspaces.com/data/files/1758812335/UNDERTUNES.zip";
  #     hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  #   };
  # };


}
