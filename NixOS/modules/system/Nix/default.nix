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
        "https://nixpkgs-python.cachix.org"
        "https://kopuz.cachix.org"
        "https://omikuji.cachix.org"
        # "https://omikuji-claymorwan-test.cachix.org"
      ];
      
      trusted-substituters = [
        "https://cache.garnix.io"
        "https://nixpkgs-python.cachix.org"
        "https://kopuz.cachix.org"
        "https://omikuji.cachix.org"
        # "https://omikuji-claymorwan-test.cachix.org"
      ];

      trusted-public-keys = [
        "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
        "nixpkgs-python.cachix.org-1:hxjI7pFxTyuTHn2NkvWCrAUcNZLNS3ZAvfYNuYifcEU="
        "kopuz.cachix.org-1:J2X3AnAYhKTJW5S3aCLoA1ckonQXVNZMQvhZA0YAufw="
        "omikuji.cachix.org-1:dS6sbpMxarHWIIk3y0R7KXz3eVHUg1lo/y3gMbv4JhM="
        # "omikuji-claymorwan-test.cachix.org-1:kWmsQxbuLrKC1igfm5Hymi8GSQQLNTHfJz2yU9STwos="
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
    "nodejs-20.20.2"
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
