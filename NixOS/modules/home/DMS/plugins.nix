{
  pkgs,
  inputs,
  host,
  lib,
  config,
  ...
}:

let
  inherit (import ../../../variables)
    flake_dir
    ;
in

{

  imports = [
    inputs.dms-plugin-registry.modules.default
    inputs.nix-monitor.homeManagerModules.default
  ];

  programs = {
    nix-monitor = {
      enable = true;

      rebuildCommand = [
        "zsh"
        "-c"
        "sudo ${pkgs.nh}/bin/nh os switch ${flake_dir} --hostname ${host} --no-nom --bypass-root-check"
      ];

      # ts pisses me off im using a script now
      generationsCommand = [
        "sh"
        "${flake_dir}/modules/home/DMS/nix-monitor-gen.sh"
      ];

      gcCommand = [
        "zsh"
        "-c"
        "sudo ${pkgs.nh}/bin/nh clean all ${config.programs.nh.clean.extraArgs}"
      ];
    };

    dank-material-shell = {
      plugins = {

        # Wallpaper engine
        linuxWallpaperEngine.enable = true;

        # Web search
        webSearch.enable = true;

        # Calculator
        calculator.enable = true;

        # Emoji launcher
        emojiLauncher.enable = true;

        # docker manager
        dockerManager.enable = true;

        # Pomodoro
        dankPomodoroTimer.enable = true;

        # Weather desktop
        dankDesktopWeather.enable = true;

        alarmClock.enable = true;

        appShortcut.enable = true;

        mediaPlayer.enable = true;

        desktopCommand.enable = true;

        amdGpuMonitor.enable = true;

        # KDE Connect
        # Plugins doesn't work when called `dankKDEConnect`, so i gotta do this to rename it
        phoneConnect = {
          enable = true;
          src = inputs.dms-plugin-registry.packages.${pkgs.stdenv.hostPlatform.system}.dankKDEConnect;
        };

        mediaFrame.enable = true;

        dankGifSearch.enable = true;

        dankHyprlandWindows.enable = true;
      };
    };
  };
}
