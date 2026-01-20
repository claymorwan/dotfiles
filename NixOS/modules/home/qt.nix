{
  pkgs,
  lib,
  config,
  ...
}:

let
  qtctSettings = {
    Appearance = {
      style = "Darkly";
      custom_palette = true;
      icon_theme = config.gtk.iconTheme.name;
    };
  };

  inherit (import ../../variables/variables.nix)
  ctp_flavor
  ctp_accent
  ;
in
{
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum

    # kdePackages.qt6ct.overrideAttrs (finalAttrs: previousAttrs: {
    #   patches = [
    #     fetchpatch {
    #       url = "https://aur.archlinux.org/cgit/aur.git/plain/qt6ct-shenanigans.patch?h=qt6ct-kde";
    #       hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    #     }
    #   ];
    # })
    #
    # libsForQt5.qt5ct.override {
    #   patches = [
    #     fetchpatch {
    #       url = "https://aur.archlinux.org/cgit/aur.git/plain/qt5ct-shenanigans.patch?h=qt5ct-kde";
    #       hash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
    #     }
    #   ];
    # }
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "Darkly";
      package = with pkgs; [
        darkly
        darkly-qt5
      ];
    };

    qt5ctSettings = lib.recursiveUpdate qtctSettings { 
      Appearance.color_scheme_path = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/catppuccin-${ctp_flavor}-${ctp_accent}.conf";
    };

    qt6ctSettings = lib.recursiveUpdate qtctSettings {
      Appearance.color_scheme_path = "${pkgs.catppuccin-qt5ct}/share/qt6ct/colors/catppuccin-${ctp_flavor}-${ctp_accent}.conf";
    };
  };
}
