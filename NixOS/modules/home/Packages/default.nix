{
  inputs,
  lib,
  pkgs,
  host,
  ...
}:

{
  imports = [
  ]
  ++ (lib.optionals (host != "android") [./desktop.nix])
  ;
  
  home.packages = with pkgs; [
    fzf
    lolcat
    kittysay
    inputs.pyroclear.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
}
