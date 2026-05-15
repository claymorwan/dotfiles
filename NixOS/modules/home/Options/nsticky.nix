{ inputs, lib, pkgs, config, ... }:

let
  inherit (lib)
  mkOption
  mkEnableOption
  mkPackageOption
  types
  mkIf
  ;

  cfg = config.programs.nsticky;
  tomlFormat = pkgs.formats.toml { };
in
{
  options.programs.nsticky = {
    enable = mkEnableOption "nsticky";
    package = mkPackageOption inputs.nsticky.packages.${pkgs.stdenv.hostPlatform.system} "nsticky" { nullable = true; };
    
    settings = mkOption {
      inherit (tomlFormat) type;
      default = { };
    };
  };

  config = mkIf cfg.enable {
    home.packages = mkIf (cfg.package != null ) [
      cfg.package
    ];

    xdg.configFile."nsticky/config.toml" = mkIf (cfg.settings != { }) {
      source = tomlFormat.generate "sticky-config" cfg.settings;
    };

    systemd.user.services.nsticky = {
      Unit = {
        Description = "nsticky service";
        PartOf = [ config.wayland.systemd.target ];
        After = [ config.wayland.systemd.target ];
      };

      Service = {
        Type = "simple";
        ExecStart = "${lib.getExe cfg.package}";
        Restart = "on-failure";
      };

      Install.WantedBy = [ config.wayland.systemd.target ];
    };
  };
}
