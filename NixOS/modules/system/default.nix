{ inputs, ... }:

{
  imports = [
    ./boot.nix
    ./catppuccin.nix
    ./clamav.nix
    ./dms.nix
    ./virtualisation.nix
    ./fonts.nix
    ./networking.nix
    ./nix
    ./overlays.nix
    ./packages
    ./printing.nix
    ./services.nix
    ./security.nix
    ./steam.nix
    ./system.nix
    ./users.nix
  ];
}
