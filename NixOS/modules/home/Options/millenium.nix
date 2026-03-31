{ pkgs, lib, config, ... }:

let
  inherit (lib)
  mkOption
  mkEnableOption
  types
  literalExpression
  mkIf
  ;

  cfg = config.programs.steam.millenium;
in
{
  options.programs.steam.millenium = {
    enable = mkEnableOption "devenvcp";

    themes = mkOption {
      type = with types; listOf package;
      default = [];
      example = literalExpression ''
      '';

      description = ''
        Theme packages to install in `$XDG_DATA_HOME/Steam/steamui/skins`.
      '';
    };

    plugins = mkOption {
      type = with types; listOf package;
      default = [];
      example = literalExpression ''
      '';

      description = ''
        Plugins packages to install in `$XDG_DATA_HOME/millennium/plugins`.
      '';
    };
  };

  config = mkIf cfg.enable {
    xdg.dataFile = {
      "Steam/steamui/skins" = mkIf (cfg.themes != [ ]) {
        recursive = true;
        source = pkgs.symlinkJoin {
          name = "millenium-themes";
          paths = cfg.themes;
        };
      };

      "millenium/plugins" = mkIf (cfg.plugins != [ ]) {
        recursive = true;
        source =pkgs.symlinkJoin {
          name = "millenium-plugins";
          paths = cfg.plugins;
        };
      };
    };
  };
}
