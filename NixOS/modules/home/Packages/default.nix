{ inputs, pkgs, config, ... }:

let
  inherit (import ../../../variables)
  flake_dir;
in 
{
  imports = [
    ./flatpak.nix
    inputs.devenvcp.homeModules.default
    inputs.namida.homeManagerModules.namida
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    devenvcp = {
      enable = true;
      defaultPath = "${flake_dir}/dev-shells/devenv";
    };

    namida = {
      # enable = true;
      package = inputs.namida.packages.${pkgs.stdenv.hostPlatform.system}.beta;
    };

    onlyoffice.enable = true;
    btop.enable = true;
  };

  home.packages = with pkgs; [
    # CLIs
    ookla-speedtest
    # speedtest-cli
    dragon-drop
    scrcpy
    yt-dlp-light
    lolcat
    kittysay
    sl
    zenity
    pipes
    cbonsai
    linux-wallpaperengine
    wev
    devenv
    inputs.lncur.packages.${pkgs.stdenv.hostPlatform.system}.default

    # GUI
    equibop
    stoat-desktop
    packet
    localsend
    catppuccinifier-gui
    gnome-font-viewer
    gnome-disk-utility
    kooha
    bottles
    obsidian
    qalculate-gtk
    protonvpn-gui
    intiface-central
    polychromatic
    fragments
    winboat
    inputs.gsr.packages.${pkgs.stdenv.hostPlatform.system}.gpu-screen-recorder-ui
    
    (pkgs.callPackage ../../../pkgs/fluxer/default.nix { inherit (inputs) fluxer-src; })
    (pkgs.callPackage ../../../pkgs/shiru/package.nix { })
    (pkgs.callPackage ../../../pkgs/shijima-qt-bin { })
    (pkgs.gradia.overrideAttrs (finalAttrs: {
      patches = [ ./gradia.patch ];
    }))
    (lib.mkIf config.programs.noctalia-shell.enable (pkgs.callPackage ../../../pkgs/wallpaperengine-gui { }))

    # Kde stuff
    kdePackages.gwenview
    kdePackages.ksshaskpass
  ];
}
