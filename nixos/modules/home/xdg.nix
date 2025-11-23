{ pkgs, ... }:

{
  xdg = {
    enable = true;

    portal = {
      extraPortals = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-termfilechooser
      ];
    };
  };

  xdg.portal.config.common = {
    "org.freedesktop.impl.portal.FileChooser" = "termfilechooser";
  };

  xdg.configFile."xdg-desktop-portal-termfilechooser/config" = {
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

}
