{ pkgs, inputs, ... }:

{
  imports = [
    ./nh.nix
  ];
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
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

      libraries = [
        (pkgs.runCommand "steamrun-lib" { } "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")
      ]
      ++ (with pkgs; [
        # libunarr
        # kdePackages.qtbase
        # kdePackages.qtmultimedia
        # libx11
        # wayland
      ]);
    };
  };

  environment.systemPackages = with pkgs; [
    nurl
    update-nix-fetchgit
    nixpkgs-review
    inputs.nix-output-monitor.packages.${pkgs.stdenv.hostPlatform.system}.default
    expect
  ];
}
