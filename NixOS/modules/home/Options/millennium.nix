{ pkgs, lib, config, ... }:

let
  inherit (lib)
  mkOption
  mkEnableOption
  types
  literalExpression
  mkIf
  ;

  cfg = config.programs.steam.millennium;
in
{
  options.programs.steam.millennium = {
    enable = mkEnableOption "devenvcp";

    themes = mkOption {
      type = with types; attrsOf (oneOf [ package path ]);
      default = {};
      example = literalExpression ''
      '';

      description = ''
        Theme packages to install in `$XDG_DATA_HOME/Steam/steamui/skins`.
      '';
    };

    plugins = mkOption {
      type = with types; attrsOf (oneOf [ package path ]);
      default = {};
      example = literalExpression ''
      '';

      description = ''
        Plugins packages to install in `$XDG_DATA_HOME/millennium/plugins`.
      '';
    };
  };

  config = mkIf cfg.enable {
    xdg.dataFile = lib.mergeAttrs
      (lib.mapAttrs' (
        name: value: lib.nameValuePair "Steam/steamui/skins/${name}" { source = value; }
      ) cfg.themes)
      (lib.mapAttrs' (
        name: value: lib.nameValuePair "millennium/plugins/${name}" { source = value; }
      ) cfg.plugins);
    #   {
    #   "Steam/steamui/skins" = mkIf (cfg.themes != [ ]) {
    #     recursive = true;
    #     source = pkgs.symlinkJoin {
    #       name = "millennium-themes";
    #       paths = cfg.themes;
    #     };
    #   };
    #
    #   "millennium/plugins" = mkIf (cfg.plugins != [ ]) {
    #     recursive = true;
    #     source =pkgs.symlinkJoin {
    #       name = "millennium-plugins";
    #       paths = cfg.plugins;
    #     };
    #   };
    # }
    # // (lib.mapAttrs' (
    #     name: value: lib.nameValuePair "Steam/steamui/skins/${name}" { source = value; }
    #   ) cfg.themes)
    # // (lib.mapAttrs' (
    #     name: value: lib.nameValuePair "millennium/plugins/${name}" { source = value; }
    #   ) cfg.plugins)
    # ;
  };
}
