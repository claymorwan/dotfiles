{ inputs, pkgs, config, ... }:

{
  imports = [
    ./flatpak.nix
  ];

  nixpkgs.config.allowBroken = true;

  programs = {
    hyprland = {
      enable = config.globVars.enableHyprland;
      package = pkgs.hyprland;
      withUWSM = false;
    };

    hyprlock.enable = config.globVars.enableHyprland;

    niri = {
      enable = config.globVars.enableNiri;
      package = inputs.niri-pkg.packages.${pkgs.stdenv.hostPlatform.system}.default;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };

    kdeconnect = {
      enable = true;
      # package = pkgs.valent;
    };

    gpu-screen-recorder.enable = true;
    droidcam.enable = true;
  };

  # Allow unfree pkg
  nixpkgs.config.allowUnfree = true;

  systemd.user.services.niri-flake-polkit.enable = false;

  environment.systemPackages = with pkgs; [
    kitty
    bat
    fastfetch
    blahaj
    tuckr
    eza
    fd
    ffmpeg-full
    uwsm
    v4l-utils
    wget
    wl-clipboard
    app2unit
    rar
    unzip
    efibootmgr
    imagemagick
    # inputs.entangled.packages.${pkgs.stdenv.hostPlatform.system}.default
    usbutils
    wlr-randr
    android-tools

    gnumake
    gcc
    python3
    uv
    lua
    go
    # dotnetCorePackages.dotnet_10.sdk

    vlc
    mpv
    gpu-screen-recorder-gtk
  ];

}
