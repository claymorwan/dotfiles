{ pkgs, ... }:

{
  imports = [
    ./termfilepickers.nix
  ];
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-hyprland
        xdg-desktop-portal-termfilechooser
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];
      config = {
        common = {
          # "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
        };

        hyprland = {
          default = [
            "hyprland"
            "gtk"
          ];
          # "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
        };

        niri = {
          default = [
            "gtk"
            "gnome"
          ];
          # "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
        };
      };
    };
  };
}
