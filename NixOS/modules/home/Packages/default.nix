{ inputs, pkgs, config, osConfig, ... }:

{
  imports = [
    ./flatpak.nix
    inputs.devenvcp.homeModules.default
    # inputs.namida.homeManagerModules.namida
  ];

  programs = {
    direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    devenvcp = {
      enable = true;
      defaultPath = "${osConfig.globVars.flake_dir}/dev-shells/devenv";
    };

    # namida = {
    #   enable = true;
    #   package = inputs.namida.packages.${pkgs.stdenv.hostPlatform.system}.beta;
    # };

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
    fluxer
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
    proton-vpn
    intiface-central
    polychromatic
    fragments
    audacity
    winboat
    inputs.gsr.packages.${pkgs.stdenv.hostPlatform.system}.gpu-screen-recorder-ui
    
    shiru
    shijima-qt-bin
    (pkgs.gradia.overrideAttrs (finalAttrs: {
      patches = [ ./gradia.patch ];
    }))
    (lib.mkIf config.programs.noctalia-shell.enable pkgs.wallpaperengine-gui)

    # Kde stuff
    kdePackages.gwenview
    kdePackages.ksshaskpass
  ];
}
