{ lib, pkgs, config, ... }:

let
  inherit (lib)
  mkOption
  mkEnableOption
  mkPackageOption
  types
  mkIf
  optional
  literalExpression
  ;

  cfg = config.programs.omikuji;
  tomlFormat = pkgs.formats.toml { };
in {
  options.programs.omikuji = {
    enable = mkEnableOption "omikuji";
    package = mkPackageOption pkgs "omikuji-bin" { nullable = true; };

    extraPackages = mkOption {
      type = with types; listOf package;
      default = [ ];
      example = "with pkgs; [mangohud winetricks gamescope gamemode umu-launcher]";
      description = ''
        List of packages to pass as extraPkgs to lutris.
        Please note runners are not detected properly this way, use a proper option for those.
      '';
    };

    steamPackage = mkOption {
      type = with types; nullOr package;
      default = null;
      example = "pkgs.steam or osConfig.programs.steam.package";
      description = ''
        This must be the same you use for your system, or two instances will conflict,
        for example, if you configure steam through the nixos module, a good value is "osConfig.programs.steam.package"
      '';
    };

    winePackages = mkOption {
      type = with types; listOf package;
      default = [ ];
      example = "[ pkgs.wineWow64Packages.full ]";
      description = ''
        List of wine packages to be added for lutris to use.
      '';
    };

    protonPackages = mkOption {
      type = with types; listOf package;
      default = [ ];
      example = "[ pkgs.proton-ge-bin ]";
      description = ''
        List of proton packages to be added for lutris to use with umu-launcher.
      '';
    };

    settings = {
      defaults = mkOption {
        inherit (tomlFormat) type;
        default = { };
        example = literalExpression ''
          wine = {
            ntsync = true
            dxvk = true
            vkd3d = true
            d3d_extras = true
          };

          "launch.env" = {
            PROTON_USE_WAYLAND = "1";
          };

          graphics.mangohud = true;
          system.gamemode = true;
        '';
        description = ''
          Configuration written to
          {file}`$XDG_DATA_HOME/omikuji/defaults.toml`.
        '';
      };
    };
  };

  config = {
    # home.packages = mkIf (cfg.package != null) [
    #   (cfg.package.override {
    #     extraPkgs = (_prev: cfg.extraPackages ++ (optional (cfg.steamPackage != null) cfg.steamPackage));
    #   })
    # ];

    xdg.dataFile =
    let
      formatWineName = (package: lib.toLower package.name);

      buildWineLink =
        packages:
        map (
          # lutris seems to not detect wine/proton if the name has some caps
          package:
          (lib.nameValuePair "omikuji/runners/${formatWineName package}" {
            source = package;
          })
        ) packages;

      protonPackages = map (proton: proton.steamcompattool) cfg.protonPackages;
    
    in lib.mergeAttrs
    (lib.mapAttrs' (
      name: value: lib.nameValuePair "omikuji/${name}.toml" { source = tomlFormat.generate "omikuji-config-${name}" value; }
    ) cfg.settings)
    (lib.listToAttrs (buildWineLink cfg.winePackages ++ buildWineLink protonPackages));
  };
}
