{ pkgs, ... }:

{
  imports = [
    ./dms.nix
    # ./sddm.nix
  ];

  environment.systemPackages = [ pkgs.mouse-cursor ];
}
