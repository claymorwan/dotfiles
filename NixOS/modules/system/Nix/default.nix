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

      substituters = ["https://hyprland.cachix.org"];
      
      trusted-substituters = [
        "https://hyprland.cachix.org"
        "https://ejb1123.cachix.org"
      ];

      trusted-public-keys = [
        "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="
        "ejb1123.cachix.org-1:ay+9Fw4EX2GbTK8tqoPSYKLVpskg5MtMzxGHw27vZ2Q="
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
