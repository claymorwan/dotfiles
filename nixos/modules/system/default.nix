{ inputs, ... }:

{
  imports = [
    ./boot.nix
    ./catppuccin.nix
    ./clamav.nix
    ./dmsgreeter.nix
    ./flatpak.nix
    ./fonts.nix
    ./networking.nix
    ./packages.nix
    ./printing.nix
    ./service.nix
    ./steam.nix
    ./system.nix
    ./users.nix
  ];
}
