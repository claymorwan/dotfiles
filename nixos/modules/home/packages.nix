{ pkgs, system, inputs, ... }:

{

  programs = {
    firefox.enable = true;
  };
  home.packages = with pkgs; [
    #ghostty
    #yazi
    speedtest-cli

    equibop
    gradia
    #adw-gtk3
    adwsteamgtk
    #papirus-icon-theme

    gnome-font-viewer
    gnome-disk-utility

    lutris
    # (lutris.overrideAttrs (_: prevAttrs: {
    #   multiPkgs = prevAttrs.multiPkgs ++ [
    #     (pkgs.runCommand "steamrun-lib" { } ''
    #       mkdir "$out"
    #       ln -s "${pkgs.steam-run.fhsenv}"/usr/lib64 "$out"/lib
    #     '')
    #   ];
    # }))
    gamemode
    mangohud
    # umu-launcher
    prismlauncher
    protonplus
    kooha

    obsidian

    linux-wallpaperengine

    kdePackages.gwenview
    kdePackages.kdenlive
  ];
}
