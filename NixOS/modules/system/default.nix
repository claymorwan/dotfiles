{ inputs, ... }:

{
  imports = [
    ./boot.nix
    ./catppuccin.nix
    ./clamav.nix
    ./virtualisation.nix
    ./fonts.nix
    ./Greeters
    ./networking.nix
    ./Nix
    ./overlays.nix
    ./Packages
    ./pacman.nix
    ./printing.nix
    ./services.nix
    ./security.nix
    ./steam.nix
    ./system.nix
    ./users.nix
    ./XDG
  ];
}
