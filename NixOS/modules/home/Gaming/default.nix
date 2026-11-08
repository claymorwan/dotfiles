{ inputs, pkgs, ... }:

let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  imports = [
    # ./lutris.nix
    ./mangohud.nix
    ./omikuji.nix
    ./steam.nix
  ];

  home.packages = with pkgs; [
    inputs.amethyst.packages.${system}.default
    # nur.repos.rogreat.amethyst-mod-manager
    # nur.repos.forkprince.twintaillauncher
    # inputs.nurpkgs.packages.${system}.twintaillauncher
    nur.repos.claymorwan.twintaillauncher
    prismlauncher
    protonplus
    gale
    olympus
    inputs.prefixer.packages.${system}.default
    # sm64coopdx

    (osu-lazer-bin.override {
      nativeWayland = true;
    })
  ];
}
