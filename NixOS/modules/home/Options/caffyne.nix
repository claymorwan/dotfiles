{ inputs, lib, pkgs, config, ... }:

let
  cfg = config.programs.caffyne-shell;

  inherit (lib)
    mkOption
    mkIf
    types
    ;
in
{
  options.programs.caffyne-shell = {
    enable = lib.mkEnableOption "caffyne-shell";
    package = lib.mkPackageOption inputs.caffyne.packages.${pkgs.stdenv.hostPlatform.system} "default" { nullable = true; };

    systemd = {
      enable = mkOption {
        type = types.bool;
        default = true;
        description = "";
      };

      target = mkOption {
        type = types.str;
        default = config.wayland.systemd.target;
        defaultText = lib.literalExpression "config.wayland.systemd.target";
        description = "Systemd target to bind to.";
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = mkIf (cfg.package != null) [
      cfg.package
      inputs.nurpkgs.packages.${pkgs.stdenv.hostPlatform.system}.fabric-cli
    ];

    systemd.user.services.caffyne = mkIf cfg.systemd.enable {
      Unit = {
        Description = "caffyne-shell";
        PartOf = [ cfg.systemd.target ];
        After = [ cfg.systemd.target ];
      };

      Service = {
        ExecStart = lib.getExe cfg.package;
        Restart = "on-failure";
      };

      Install.WantedBy = [ cfg.systemd.target ];
    };
  };
}
