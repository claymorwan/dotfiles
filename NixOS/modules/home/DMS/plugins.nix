{
  pkgs,
  inputs,
  host,
  ...
}:

let
  inherit (import ../../../variables/variables.nix)
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
        "${flake_dir}/modules/home/dms/nix-monitor-gen.sh"
      ];

      gcCommand = [
        "zsh"
        "-c"
        "sudo ${pkgs.nh}/bin/nh clean all"
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

        dankKDEConnect.enable = true;

        mediaFrame.enable = true;
      };
    };
  };
}
