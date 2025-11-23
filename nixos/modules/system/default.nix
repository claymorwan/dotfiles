{ inputs, ... }:

{
  imports = [
    ./catppuccin.nix
    ./boot.nix
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
