{ inputs, ... }:

{
  imports = [
    ./boot.nix
    ./catppuccin.nix
    ./clamav.nix
    ./dms.nix
    ./virtualisation.nix
    ./flatpak.nix
    ./fonts.nix
    ./networking.nix
    ./nix
    ./packages.nix
    ./printing.nix
    ./services.nix
    ./security.nix
    ./steam.nix
    ./system.nix
    ./users.nix
  ];
}
