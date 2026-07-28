{ pkgs, ... }:

{
  imports = [
    # ./Floorp
    # ./helium.nix
    ./Zen
  ];

  home.packages = with pkgs; [
    chromium
  ];
}
