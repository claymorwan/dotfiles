{ pkgs, ... }:

{
  imports = [
    # ./Floorp
    # ./helium.nix
    # ./Waterfox
    ./Zen
  ];

  home.packages = with pkgs; [
    chromium
  ];
}
