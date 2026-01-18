{ pkgs, lib, ... }:

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

      config = let
        defaultPortalCfg = {
          # "org.freedesktop.impl.portal.FileChooser" = [ "termfilechooser" ];
        };
      in
      {
        common = defaultPortalCfg;

        hyprland = lib.recursiveUpdate defaultPortalCfg {
          default = [
            "hyprland"
            "gtk"
          ];
        };

        # niri = lib.recursiveUpdate defaultPortalCfg {
        #   default = lib.mkDefault [
        #     "gtk"
        #     "gnome"
        #   ];
        # };
      };
    };

    terminal-exec = {
      enable = true;
      settings = {
        default = [
          "com.mitchellh.ghostty.desktop"
        ];
      };
    };
  };
}
