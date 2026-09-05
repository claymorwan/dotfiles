{ inputs, pkgs, host, lib, config, osConfig, ... }:

let
  dms-plugins = config.programs.dank-material-shell.plugins;
  system = pkgs.stdenv.hostPlatform.system;
  plugin-packages = inputs.dms-plugin-registry.packages.${system};
  inherit (lib) mkIf;
in 
{

  imports = [
    inputs.dms-plugin-registry.homeModules.default
    inputs.nix-monitor.homeManagerModules.default
  ];

  # Deps for plugins
  # Lots of them are already installed but it don't to add them here too
  home.packages = with pkgs; [
    (mkIf dms-plugins.amdGpuMonitor.enable amdgpu_top)
    (mkIf dms-plugins.displayManager.enable ddcutil)
    (mkIf dms-plugins.discordVoice.enable python3)
    (mkIf dms-plugins.timer.enable libnotify)
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
      qt6.qt5compat
    ]) else [])
  ++ (if dms-plugins.mpvpaperWallpaper.enable then (with pkgs; [
      mpvpaper
      ffmpeg-headless
    ]) else [])
  ++ (if dms-plugins.dms-quick-capture.enable then (with pkgs; [
      file
      imagemagick
      img2pdf
      tesseract
      zbar
    ]) else [])
    ++ (if dms-plugins.screenCaptureToolbar.enable then (with pkgs; [
      slurp
      grim
      jq
    ]) else [])
    ++ (if dms-plugins.materialPlayer.enable then (with pkgs; [
      python3
      cava
    ]) else [])
  ;

  programs = {
    nix-monitor = {
      enable = true;

      # rebuildCommand = [
      #   "sh"
      #   "-c"
      #   "sudo ${pkgs.nh}/bin/nh os switch ${osConfig.globVars.flake_dir} --hostname ${host} --no-nom --bypass-root-check"
      # ];

      generationsCommand = [
        (lib.getExe pkgs.nushell)
        "-c"
        "nh os info | lines | drop nth 0 1 | length"
      ];

      storeSizeCommand = [
        "sh"
        "-c"
        "nix path-info --json --all | ${lib.getExe pkgs.jq} 'map(.narSize) | add' | numfmt --to=iec"
      ];

      updateInterval = 600;

      # gcCommand = [
      #   "sh"
      #   "-c"
      #   "sudo ${pkgs.nh}/bin/nh clean all ${osConfig.programs.nh.clean.extraArgs}"
      # ];
    };

    dank-material-shell = {
      plugins = {
        # linuxWallpaperEngine.enable = true;
        webSearch.enable = true;
        calculator.enable = true;
        emojiLauncher.enable = true;
        dockerManager.enable = true;
        dankPomodoroTimer.enable = true;
        dankDesktopWeather.enable = true;
        # alarmClock.enable = true;
        # appShortcut.enable = true;
        # mediaPlayer.enable = true;
        # desktopCommand.enable = true;
        mediaFrame.enable = true;
        # dankGifSearch.enable = true;
        dankHyprlandWindows.enable = osConfig.programs.hyprland.enable;
        # polyglot.enable = true;
        # commandRunner.enable = true;
        developerUtilities.enable = true;
        # dankNotepadModule.enable = true;
        # musicLyrics.enable = true;
        dankAudioVisualizer.enable = true;
        # screenRecorder.enable = true;
        usbManager.enable = true;
        easyEffects.enable = config.services.easyeffects.enable;
        discordVoice.enable = true;
        # dmsScreenshot.enable = true;
        # clipboardPlus.enable = true;
        # mpvpaperWallpaper.enable = true;
        # timer.enable = true;
        # mediaControlPlus.enable = true;
        # nixPackageRunner.enable = true;
        # quickCapture.enable = true;
        # githubHeatmapRevive.enable = true;    
        desktopWidgetToggle.enable = true;
        dropdownMenu.enable = true;
        # mediaDownloader.enable = true;
        screenCaptureToolbar.enable = true;
        materialPlayer.enable = true;
        protonVPN.enable = true;
        # nothingClock.enable = true;
        batteryOSD.enable = lib.mkIf (host == "nixos-laptop") true;
        # typingSounds.enable = true;

        dms-common = {
          enable = true;
          src = inputs.dms-common;
        };

        dms-wallpaper-engine = {
          enable = true;
          src = plugin-packages.linuxWallpaperEngine;
        };

        dms-quick-capture = {
          enable = true;
          src = plugin-packages.quickCapture;
        };
        
        dankPinentry = {
          # enable = true;
          src = lib.mkForce inputs.dms-plugin-dankPinentry.packages.${system}.dms-plugin;
        };
        
        # KDE Connect
        phoneConnect = {
          enable = osConfig.programs.kdeconnect.enable;
          src = plugin-packages.dankKDEConnect;
        };
        
        liveChartSchedule = { 
          # enable = true;
          src = let
            liveChartSchedule = plugin-packages.liveChartSchedule;
          in
          lib.mkForce (pkgs.symlinkJoin {
            inherit (liveChartSchedule) pname version;

            paths = [ liveChartSchedule ];
            nativeBuildInputs = with pkgs; [
              python3Packages.wrapPython
            ];

            pythonInputs = with pkgs.python3Packages; [
              beautifulsoup4
              browser-cookie3
            ];

            postBuild = ''
              buildPythonPath "$pythonInputs"

              wrapProgram $out/fetch_livechart.py \
                --prefix PATH : $program_PATH \
                --set PYTHONHOME ${pkgs.python3} \
                --set PYTHONPATH $program_PYTHONPATH
            '';
          });
        };
      };
    };
  };
}
