{ pkgs, ... }:

{
  imports = [
    ./lutris.nix
    ./mangohud.nix
  ];

  home.packages = with pkgs; [
    gamemode
    prismlauncher
    protonplus
    limo
    # wine-discord-ipc-bridge

    # osu-lazer-bin
    sm64coopdx
  ];
}
