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

  jsonFormat = pkgs.formats.json { };
  json5 = pkgs.python3Packages.toPythonApplication pkgs.python3Packages.json5;
  impureConfigMerger = empty: jqOperation: path: staticSettings: ''
    mkdir -p $(dirname ${lib.escapeShellArg path})
    if [ ! -e ${lib.escapeShellArg path} ]; then
      # No file? Create it
      echo ${lib.escapeShellArg empty} > ${lib.escapeShellArg path}
    fi
    dynamic="$(${lib.getExe json5} --as-json ${lib.escapeShellArg path} 2>/dev/null || echo ${lib.escapeShellArg empty})"
    static="$(cat ${lib.escapeShellArg staticSettings})"
    config="$(${lib.getExe pkgs.jq} -n ${lib.escapeShellArg jqOperation} --argjson dynamic "$dynamic" --argjson static "$static")"
    printf '%s\n' "$config" > ${lib.escapeShellArg path}
    unset config
  '';
in
{
  options.programs.steam.millennium = {
    enable = mkEnableOption "millennium";

    activeTheme = mkOption {
      type = with types; nullOr str;
      default = null;
      example = "material";
      description = ''
        Name of theme default theme. Needs to be the same name as one of the attr in `programs.steam.millennium.themes` or "default for default Steam theme.
      '';
    };

    themes = mkOption {
      type = with types; attrsOf (oneOf [ package path ]);
      default = {};
      example = literalExpression ''
        {
          material = pkgs.millennium-material-theme;
        }
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

    config = mkOption {
      type = jsonFormat.type;
      default = { };
      example = literalExpression ''
        {
          themes.conditions = {
            material.Color = "Catppuccin";
          };
        }
      '';
      description = ''
        Configuration written to Milennium's {file}`$XDG_CONFIG_HOME/millennium/config.json`.
      '';
    };

    mutableConfig = mkOption {
      type = types.bool;
      default = true;
      example = false;
      description = ''
        Whether the config can be updated by Millennium. 
      '';
    };
  };

  config = let
    mergedSettings = cfg.config
      // (lib.optionalAttrs (cfg.activeTheme != null) { themes.activeTheme = cfg.activeTheme; })
    ;
  in
  mkIf cfg.enable {
    home.activation = mkIf (cfg.mutableConfig && mergedSettings != { }) {
      millenniumSettingsActivation = lib.hm.dag.entryAfter [ "linkGeneration" ] (
        impureConfigMerger "{}" "$dynamic * $static" "${config.xdg.configHome}/millennium/config.json" (
          jsonFormat.generate "millennium-user-settings" mergedSettings
        )
      );
    };

    xdg = {
      dataFile = lib.mergeAttrs
        (lib.mapAttrs' (
          name: value: lib.nameValuePair "Steam/steamui/skins/${name}" { source = value; }
        ) cfg.themes)
        (lib.mapAttrs' (
          name: value: lib.nameValuePair "millennium/plugins/${name}" { source = value; }
        ) cfg.plugins)
      ;
    };
  };
}
