{ lib, host, ... }:

{
  imports = [
    ./catppuccin.nix
    ./fonts.nix
    ./Nix
    ./Packages
    ./users.nix
  ]
  ++ (lib.optionals (host != "android") [
    ./archix.nix
    ./boot.nix
    ./virtualisation.nix
    ./Greeters
    ./networking.nix
    ./Options
    ./security.nix
    ./services.nix
    ./steam.nix
    ./system.nix
    ./XDG
    # ./xserver.nix
  ]);
}
