{ pkgs, lib, config, ... }:

{
  imports = [
    ./termfilepickers.nix
  ];
  xdg = {
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [
        (lib.mkIf config.programs.hyprland.enable xdg-desktop-portal-hyprland)
        lib.mkIf (config.services.xdg-desktop-portal-termfilepickers == false) xdg-desktop-portal-termfilechooser
        xdg-desktop-portal-gtk
        xdg-desktop-portal-gnome
      ];

      config = let
        defaultPortalCfg = {
          "org.freedesktop.impl.portal.FileChooser" = lib.mkIf (config.services.xdg-desktop-portal-termfilepickers == false) ["termfilechooser"];
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
