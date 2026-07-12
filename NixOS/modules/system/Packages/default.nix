{ lib, pkgs, host, ... }:


{
  imports = [
  ]
  ++ (lib.optionals (host != "android") [./desktop.nix])
  ;
  
  # Allow unfree pkg
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    kitty
    bat
    fastfetch
    blahaj
    tuckr
    eza
    fd
    wget
  ];
}
