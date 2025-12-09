{ pkgs, config, lib, ... }:

with lib;
let
  qtCtAppearanceConfig = generators.toINI { } {
    Appearance = {
      icon_theme = config.gtk.iconTheme.name;
    };
  };
in
{
  home.packages = [
    pkgs.libsForQt5.qtstyleplugin-kvantum
    pkgs.libsForQt5.qt5ct
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style.name = "kvantum";
  };

  # qt5ct
  home.file.".config/qt5ct/qt5ct.conf" = {
  #  target = "qt5ct/qt5ct.conf";
    text = qtCtAppearanceConfig;
  };

  # qt6ct
  home.file.".config/qt6ct/qt6ct.conf" = {
  #  target = "qt6ct/qt6ct.conf";
  text = qtCtAppearanceConfig;
  };
}
