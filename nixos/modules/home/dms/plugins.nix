{ pkgs, ... }:

let
  official_plugins = pkgs.fetchFromGitHub {
    owner = "AvengeMedia";
    repo = "dms-plugins";
    rev = "8715ca35b61d7c6275a300fa4992e2b0490f70f7";
    hash = "sha256-6ScuVcvSaXc35Sf1iwtCy8aM/pFID3+0G4NRMw8aBcM=";
  };
in

{
  programs.dankMaterialShell = {
    plugins = {

      # Wallpaper engine
      dms-wallpaperengine = {
        enable = true;
        src = pkgs.fetchFromGitHub {
          owner = "sgtaziz";
          repo = "dms-wallpaperengine";
          rev = "0a8796637d0dd2089610b3ea7033d53df09617cb";
          hash = "sha256-pHHSFBggN05HyE8ig5tetqLLEjk4DpnehzDRK9pMwH8=";
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
    };
  };
}
