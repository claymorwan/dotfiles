{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
  amethyst = (inputs.amethyst.legacyPackages.${system}).amethyst-mod-manager;
in
{
  imports = [
    ./lutris.nix
    ./mangohud.nix
    ./omikuji.nix
    ./steam.nix
  ];

  home.packages = with pkgs; [
    amethyst
    # nur.repos.rogreat.amethyst-mod-manager

    prismlauncher
    protonplus
    limo
    gale
    olympus
    inputs.prefixer.packages.${system}.default
    # sm64coopdx

    (osu-lazer-bin.override {
      nativeWayland = true;
    })
  ];

  xdg = {
    dataFile = {
      "sm64coopdx/mods/character-select-coop" = {
        source = pkgs.fetchzip {
          url = "https://github.com/Squishy6094/character-select-coop/releases/download/v1.16.3/character-select-coop.zip";
          hash = "sha256-zM6gy/+MolJcHn/SxfUyvchUtL4wn0xLolTvIZhUZ+8=";
        };
      };
    };
  };
}
