{ pkgs, config, ... }:

let
  gstPackages = with pkgs.gst_all_1; [
    gstreamer
    gst-plugins-base
    gst-libav
    # gst-vaapi
  ];
in 
{
  imports = [
    ./flatpak.nix
  ];

  nixpkgs.config.allowBroken = true;
  systemd.user.services.niri-flake-polkit.enable = false;

  programs = {
    hyprland = {
      enable = config.globVars.enableHyprland;
      package = pkgs.hyprland;
      withUWSM = false;
    };

    hyprlock.enable = config.globVars.enableHyprland;

    niri = {
      enable = config.globVars.enableNiri;
      package = pkgs.niri;
    };

    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };

    appimage = {
      enable = true;
      # binfmt = true;
    };

    kdeconnect = {
      enable = true;
      # package = pkgs.valent;
    };

    gpu-screen-recorder.enable = true;
    droidcam.enable = true;
  };
  
  environment.systemPackages = with pkgs; [
    ffmpeg-full
    uwsm
    v4l-utils
    wl-clipboard
    app2unit
    rar
    unzip
    efibootmgr
    imagemagick
    usbutils
    wlr-randr
    android-tools
    mesa-demos
    libva-utils
    gdb
    nuget-to-json
    usbutils
    wlr-randr
    android-tools
    mesa-demos
    libva-utils
    gdb
    nuget-to-json

    gnumake
    gcc
    python3
    uv
    lua
    go
    dotnetCorePackages.dotnet_10.sdk

    vlc
    mpv
  ]
  ++ gstPackages
  ; 
}
