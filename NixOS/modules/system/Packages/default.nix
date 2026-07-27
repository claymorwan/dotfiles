{ lib, pkgs, host, ... }:


{
  imports = [
  ]
  ++ (lib.optionals (host != "android") [./desktop.nix])
  ;
  
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
