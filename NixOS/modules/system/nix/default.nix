{ pkgs, ... }:

{
  imports = [
    ./nh.nix
  ];
  nix = {
    settings = { 
      experimental-features = ["nix-command" "flakes"];
      auto-optimise-store = true;
    };
    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };

  programs = {
    nix-ld = {
      enable = true;

      libraries = [(pkgs.runCommand "steamrun-lib" {}
  "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")] ++ ( with pkgs; [
        # libunarr
        # kdePackages.qtbase
        # kdePackages.qtmultimedia
        # libx11
        # wayland
      ]);
    };
  };
}
