{ pkgs, inputs, host, lib, config, osConfig, ... }:

let

  dms-plugins = config.programs.dank-material-shell.plugins; 
  inherit (import ../../../../../variables)
    flake_dir
    enableHyprland
    ;
in

{

  imports = [
    inputs.dms-plugin-registry.modules.default
    inputs.nix-monitor.homeManagerModules.default
  ];

  # Deps for plugins
  home.packages = with pkgs; [
    (lib.mkIf dms-plugins.amdGpuMonitor.enable amdgpu_top)
    (lib.mkIf dms-plugins.displayManager.enable ddcutil)
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
        dankHyprlandWindows.enable = (if enableHyprland then true else false);
        polyglot.enable = true;
        commandRunner.enable = true;
        developerUtilities.enable = true;
        dankNotepadModule.enable = true;
        ghHeatmap = {
          enable = true;
          src = lib.mkForce (inputs.dms-plugin-registry.packages.${pkgs.stdenv.hostPlatform.system}.githubHeatmap.overrideAttrs (finalAttrs: {
            prePatch = ''
              substituteInPlace ./GitHubHeatMap/HeatMapWidget.qml \
                --replace-fail '"/bin/bash"' '"bash"'
            '';
          }));
        };
        # KDE Connect
        # Plugins doesn't work when called `dankKDEConnect`, so i gotta do this to rename it
        phoneConnect = {
          enable = osConfig.programs.kdeconnect.enable;
          src = inputs.dms-plugin-registry.packages.${pkgs.stdenv.hostPlatform.system}.dankKDEConnect;
        };
      };
    };
  };
}
