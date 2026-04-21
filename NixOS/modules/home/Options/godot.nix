{ pkgs, lib, config, ... }:

let
  inherit (lib)
  mkIf
  types
  mkOption
  ;
  
  cfg = config.programs.godot;
in
{
  options.programs.godot = {
    enable = lib.mkEnableOption "godot";
    package = lib.mkPackageOption pkgs "godot" { nullable = true; };
    exportTemplates = mkOption {
      type = with types; listOf (either package path);
      default = [ ];
      description = ''
        Godot export templates to install in {file}`$XDG_DATA_HOME/godot/export_templates`.
      '';
    };
  };

  config = mkIf cfg.enable {
    home.packages = mkIf (cfg.package != null) [
      cfg.package
    ];

    xdg.dataFile."godot/export_templates" = mkIf (cfg.exportTemplates != [ ]) {
      recursive = true;
      source = pkgs.symlinkJoin {
        name = "godot-export-templates";
        paths = cfg.exportTemplates;
        stripPrefix = "/share/godot/export_templates";
      };
    };
  };
}
