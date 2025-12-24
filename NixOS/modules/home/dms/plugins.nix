{ pkgs, inputs, host, ... }:

let
  official_plugins = inputs.dms-plugins-official;
  # pkgs.fetchFromGitHub {
  #   owner = "AvengeMedia";
  #   repo = "dms-plugins";
  #   rev = "1e3dad105581d2a1aed39bc478ab955a5a70fa0f";
  #   hash = "sha256-QaES61lAxUGpzXEgAcidOsi332Ee/2uBOFoXcCsDW88=";
  # };

  lucyfire-plugins = inputs.dms-lucyfire-plugins;
  # pkgs.fetchFromGitHub {
  #   owner = "lucyfire";
  #   repo = "dms-plugins";
  #   rev = "c463cf2364567bf77ded1e52dbf09c5cf0b9d28e";
  #   hash = "sha256-SQFflM/xWFAgqgn0WUVh4eADyT+UO03jncu7RiilMb0=";
  # };
in

{

  imports = [
    inputs.nix-monitor.homeManagerModules.default
  ];

  programs = {
    nix-monitor = {
      enable = true;
            
      # Required: customize for your setup
      rebuildCommand = [ 
        "ghostty" "-e"
        "nh os switch --hostname ${host}"
        "read"
      ];
      
      gcCommand = [
        "zsh" "-c"
        "sudo ${pkgs.nh}/bin/nh clean all"
      ];
    };

    dank-material-shell = {
      plugins = {

        # Wallpaper engine
        dms-wallpaperengine = {
          enable = true;
          src = pkgs.fetchFromGitHub {
            owner = "sgtaziz";
            repo = "dms-wallpaperengine";
            rev = "295686215ba65103e20385d3e86801db074dfc01";
            hash = "sha256-HmqIAXNougNJScAQXS33CRl/+ypR9LNjGFhBOVwu5z0=";
          };
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
          src = "${inputs.dms-app-shortcut}";
        };
      };
    };
  };
}
