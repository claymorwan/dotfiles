{ inputs, pkgs, ... }:

{
  imports = [
    ./nh.nix
    ./overlays.nix
  ];

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];

      substituters = [
        "https://cache.garnix.io"
      ];
      
      trusted-substituters = [
        "https://cache.garnix.io"
      ];

      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
      ];

      auto-optimise-store = true;
    };

    gc = {
      automatic = false;
      dates = "weekly";
      options = "--delete-older-than 1w";
    };
  };

  nixpkgs.config.permittedInsecurePackages = [
    "electron-38.8.4"
  ];

  programs = {
    nix-ld = {
      enable = true;

      libraries = [
        (pkgs.runCommand "steamrun-lib" { } "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")
      ]
      ++ (with pkgs; [
        # lib here
      ]);
    };
  };

  environment.systemPackages = with pkgs; [
    nurl
    update-nix-fetchgit
    nixpkgs-review
    inputs.nix-output-monitor.packages.${pkgs.stdenv.hostPlatform.system}.default
    expect

    # For nixpkgs-review
    glow
  ];
}
