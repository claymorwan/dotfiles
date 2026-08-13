{
  lib,
  config,
  inputs,
  pkgs,
  ...
}:

let
  cfg = config.programs.shimelinux;
in
{
  options.programs.shimelinux = {
    enable = lib.mkEnableOption "ShimeLinux";
    package = lib.mkPackageOption inputs.nurpkgs.packages.${pkgs.stdenv.hostPlatform.system} "shimelinux" {
      nullable = true;
    };
    
    autostart = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Enable autostart for ShimeLinux.
        You need to have `xdg.autostart.enable` set to true for this to work.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = lib.mkIf (cfg.package != null) [ cfg.package ];
      sessionVariables._JAVA_AWT_WM_NONREPARENTING = 1;
    };

    xdg.autostart.entries = [
      "${cfg.package}/share/applications/shimelinux.desktop"
    ];
  };
}
