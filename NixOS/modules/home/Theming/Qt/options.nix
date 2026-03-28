{ pkgs, lib, config, ... }:

let
  cfg = config.qt.kvantum;

  qt5Pkg = lib.lists.all (x: x == true) [ cfg.qt5.enable (cfg.qt5.package != null) ];
in
{
  options.qt.kvantum = {
    package = lib.mkPackageOption pkgs.kdePackages "qtstyleplugin-kvantum" { nullable = true; };

    qt5 = {
      enable = lib.mkEnableOption "Kvantum Qt5 support";
      package = lib.mkPackageOption pkgs.libsForQt5 "qtstyleplugin-kvantum" {
        nullable = true;
        extraDescription = ''
          The package to use for Kvantum Qt5 support.
        '';
      };
    };
  };

  config = lib.mkIf cfg.enable {
    home.packages = lib.mkIf (cfg.package != null) [
      cfg.package
      (lib.mkIf qt5Pkg cfg.qt5.package)
    ];
  };
}
