{ pkgs, lib, config, ... }:

let
  inherit (lib)
  mkIf
  types
  mkOption
  ;
  
  cfg = config.programs.krita;
in
{
  options.programs.krita = {
    enable = lib.mkEnableOption "krita";
    package = lib.mkPackageOption pkgs "krita" { nullable = true; };

    plugins = mkOption {
      type = with types; listOf (either package path);
      default = [ ];
      description = ''
        Krita plugins to install in {file}`$XGD_DATA_HOME/krita/pykrita`.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = mkIf (cfg.package != null) [
      cfg.package
    ];

    xdg.dataFile = {
      "krita/pykrita" = mkIf (cfg.plugins != [ ]) {
        enable = true;
        recursive = true;
        source = pkgs.symlinkJoin {
          name = "krita-plugins";
          paths = cfg.plugins;
        };
      };
    };
  };
}
