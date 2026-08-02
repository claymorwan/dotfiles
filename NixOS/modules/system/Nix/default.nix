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
        "https://nix-community.cachix.org"
        # "https://cache.garnix.io"
        "https://nixpkgs-python.cachix.org"
        "https://kopuz.cachix.org"
        "https://omikuji.cachix.org"
        # "https://omikuji-claymorwan-test.cachix.org"
      ];
      
      trusted-substituters = [
        "https://nix-community.cachix.org"
        # "https://cache.garnix.io"
        "https://nixpkgs-python.cachix.org"
        "https://kopuz.cachix.org"
        "https://omikuji.cachix.org"
        # "https://omikuji-claymorwan-test.cachix.org"
      ];

      trusted-public-keys = [
        "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
        # "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
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

  # Allow unfree pkg
  nixpkgs.config= {
    allowUnfree = true;
    permittedInsecurePackages = [
      "electron-38.8.4"
      "electron-39.8.10"
      "nodejs-20.20.2"
      "electron-40.10.5"
    ];
  };

  programs = {
    nix-ld = {
      enable = true;

      libraries = [
        (pkgs.runCommand "steamrun-lib" { } "mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")
      ]
      ++ (with pkgs; [
        # lib here
        libice
        libsm
        # glib
        # gtk3
        # libappindicator-gtk3
        # # libayatana-appindicator
      ]);
    };
  };

  # Nix related packages
  environment.systemPackages = with pkgs; [
    nurl
    update-nix-fetchgit
    nixpkgs-review
    inputs.nix-output-monitor.packages.${pkgs.stdenv.hostPlatform.system}.default
    expect
  ];
}
