{ host, pkgs, options, username, ... }:

{
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
    nh = {
      enable = true;
      clean.enable = true;
      clean.extraArgs = "--keep-since 4d --keep 3";
      flake = "/home/${username}/.dotfiles/nixos"; # sets NH_OS_FLAKE variable for you
    };
    nix-ld = {
      enable = true;

      libraries = pkgs.steam-run.args.multiPkgs pkgs ++ ( with pkgs; [
        # libunarr
        # kdePackages.qtbase
        # kdePackages.qtmultimedia
        # libx11
        # wayland
      ]);
      #[(pkgs.runCommand "steamrun-lib" {}
  #"mkdir $out; ln -s ${pkgs.steam-run.fhsenv}/usr/lib64 $out/lib")];
    };
  };

  time.timeZone = "Africa/Dakar";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  # Console keymap
  console.keyMap = "fr";

    # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
}
