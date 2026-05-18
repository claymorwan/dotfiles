{ inputs, lib, pkgs, osConfig, ... }:

{
  imports = [
    ./lutris.nix
    ./mangohud.nix
    ./steam.nix
  ];

  programs.omikuji = {
    enable = true;
    package = inputs.omikuji.packages.${pkgs.stdenv.hostPlatform.system}.default;
    protonPackages = osConfig.programs.steam.extraCompatPackages;

    extraPackages = with pkgs; [
      umu-launcher
    ];
  };

  home.packages = with pkgs; [
    prismlauncher
    protonplus
    limo
    gale
    olympus
    # sm64coopdx

    # (omikuji-bin.override {
    #   extraPkgs = (_prev: with pkgs; [
    #     umu-launcher
    #   ]);
    # })

    (osu-lazer-bin.override {
      nativeWayland = true;
    })
  ];

  xdg = {
    dataFile = let
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

      # differentiatesProton = versionOlder cfg.package.version "0.5.20";
      protonPackages = map (proton: proton.steamcompattool) [ pkgs.proton-ge-bin ];
      # protonDirectory = if differentiatesProton then "proton" else "wine";
    
    in {
      "sm64coopdx/mods/character-select-coop" = {
        source = pkgs.fetchzip {
          url = "https://github.com/Squishy6094/character-select-coop/releases/download/v1.16.3/character-select-coop.zip";
          hash = "sha256-zM6gy/+MolJcHn/SxfUyvchUtL4wn0xLolTvIZhUZ+8=";
        };
      };
    };
  };
}
