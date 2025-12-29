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

  official_plugins = inputs.dms-plugins-official;
  lucyfire-plugins = inputs.dms-lucyfire-plugins;
in

{

  imports = [
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
        dms-wallpaperengine = {
          enable = true;
          src = inputs.dms-wallpaper-engine;
        };

        # Web search
        dms-web-search = {
          enable = true;
          src = pkgs.fetchFromGitHub {
            owner = "devnullvoid";
            repo = "dms-web-search";
            rev = "81ccd9fd8249b3c9ef40dde42549f807e36ae3e3";
            hash = "sha256-mKbmROijhYhy/IPbVxYbKyggXesqVGnS/AfAEyeQVhg=";
          };
        };

        # Calculator
        DankCalculator = {
          enable = true;
          src = pkgs.fetchFromGitHub {
            owner = "rochacbruno";
            repo = "DankCalculator";
            rev = "de6dbd59b7630e897a50e107f704c1cd4a131128";
            hash = "sha256-Vq+E2F2Ym5JdzjpCusRMDXd6uuAhhjAehyD/tO3omdY=";
          };
        };

        # Emoji launcher
        dms-emoji-launcher = {
          enable = true;
          src = pkgs.fetchFromGitHub {
            owner = "devnullvoid";
            repo = "dms-emoji-launcher";
            rev = "2951ec7f823c983c11b6b231403581a386a7c9f6";
            hash = "sha256-aub5pXRMlMs7dxiv5P+/Rz/dA4weojr+SGZAItmbOvo=";
          };
        };

        # docker manager
        docker-manager = {
          enable = true;
          src = pkgs.fetchFromGitHub {
            owner = "LuckShiba";
            repo = "DmsDockerManager";
            rev = "860457bbb043a6651a2cbafe6e77d443123a0b07";
            hash = "sha256-VoJCaygWnKpv0s0pqTOmzZnPM922qPDMHk4EPcgVnaU=";
          };
        };

        # Pomodoro
        DankPomodoroTimer = {
          enable = true;
          src = "${official_plugins}/DankPomodoroTimer";
        };

        # Weather desktop
        DankDesktopWeather = {
          enable = true;
          src = "${official_plugins}/DankDesktopWeather";
        };

        alarmClock = {
          enable = true;
          src = "${lucyfire-plugins}/alarmClock";
        };

        displaySettings = {
          enable = true;
          src = "${lucyfire-plugins}/displaySettings";
        };

        appShortcut = {
          enable = true;
          src = inputs.dms-app-shortcut;
        };

        mediaPlayer = {
          enable = true;
          src = inputs.dms-media-player;
        };
      };
    };
  };
}
