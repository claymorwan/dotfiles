{ inputs, pkgs, host, lib, config, osConfig, ... }:

let
  dms-plugins = config.programs.dank-material-shell.plugins;
  inherit (lib) mkIf;
in 
{

  imports = [
    inputs.dms-plugin-registry.modules.default
    inputs.nix-monitor.homeManagerModules.default
  ];

  # Deps for plugins
  # Lots of them are already installed but it don't to add them here too
  home.packages = with pkgs; [
    (mkIf dms-plugins.amdGpuMonitor.enable amdgpu_top)
    (mkIf dms-plugins.displayManager.enable ddcutil)
    (mkIf dms-plugins.discordVoice.enable python3)
  ]
  ++ (if dms-plugins.usbManager.enable then (with pkgs; [
      udisks
      bash
      util-linux
      parted
      dosfstools
      e2fsprogs
      exfatprogs
      polkit
    ]) else [])

  ++ (if dms-plugins.liveChartSchedule.enable then (with pkgs; [
      python3
      python3Packages.browser-cookie3
      qt6.qt5compat
      # (python3.withPackages (ps: with ps; [
      #   browser-cookie3
      # ]))
    ]) else [])
  ;

  programs = {
    nix-monitor = {
      enable = true;

      rebuildCommand = [
        "zsh"
        "-c"
        "sudo ${pkgs.nh}/bin/nh os switch ${osConfig.globVars.flake_dir} --hostname ${host} --no-nom --bypass-root-check"
      ];

      # ts pisses me off im using a script now
      generationsCommand = [
        "sh"
        "${osConfig.globVars.flake_dir}/modules/home/DMS/nix-monitor-gen.sh"
      ];

      gcCommand = [
        "zsh"
        "-c"
        "sudo ${pkgs.nh}/bin/nh clean all ${osConfig.programs.nh.clean.extraArgs}"
      ];
    };

    dank-material-shell = {
      plugins = {
        linuxWallpaperEngine.enable = true;
        webSearch.enable = true;
        calculator.enable = true;
        emojiLauncher.enable = true;
        dockerManager.enable = true;
        dankPomodoroTimer.enable = true;
        dankDesktopWeather.enable = true;
        alarmClock.enable = true;
        appShortcut.enable = true;
        mediaPlayer.enable = true;
        desktopCommand.enable = true;
        amdGpuMonitor.enable = true;
        mediaFrame.enable = true;
        dankGifSearch.enable = true;
        dankHyprlandWindows.enable = osConfig.globVars.enableHyprland;
        polyglot.enable = true;
        commandRunner.enable = true;
        developerUtilities.enable = true;
        dankNotepadModule.enable = true;
        githubHeatmap.enable = true;
        musicLyrics.enable = true;
        dankAudioVisualizer.enable = true;
        screenRecorder.enable = true;
        usbManager.enable = true;
        easyEffects.enable = config.services.easyeffects.enable;
        discordVoice.enable = true;
        liveChartSchedule.enable = true;
        dmsScreenshot.enable = true;
        clipboardPlus.enable = true;
        # KDE Connect
        phoneConnect = {
          enable = osConfig.programs.kdeconnect.enable;
          src = inputs.dms-plugin-registry.packages.${pkgs.stdenv.hostPlatform.system}.dankKDEConnect;
        };
      };
    };
  };
}
