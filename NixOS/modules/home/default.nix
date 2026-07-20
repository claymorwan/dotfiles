{ lib, host, ... }:

{
  imports = [
    ./catppuccin.nix
    ./Editors
    ./env.nix
    ./fetchs
    ./git.nix
    ./Packages
    ./Shells
    ./starship.nix
    ./ssh.nix
    ./Yazi
  ]
  ++ (lib.optionals (host != "android") [
    ./Art
    ./Browsers
    ./Desktops
    # ./discord.nix
    ./Gaming
    ./ghostty.nix
    ./nixcord.nix
    ./obs-studio.nix
    ./Options
    ./services.nix
    ./spotify.nix
    ./stylix.nix
    # ./Theming
    # ./uwsm.nix
    ./XDG
  ]);
}
