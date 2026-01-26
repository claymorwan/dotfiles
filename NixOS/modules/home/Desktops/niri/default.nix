{ inputs, pkgs, lib, ... }:

let
  inherit (import ../../../../variables)
  mainMod
  ;
in
{
  imports = [
    inputs.niri.homeModules.niri
    ./execs.nix
    ./keybinds
    ./layout.nix
    ./rules.nix
  ];

  programs = {
    niri = {
      package = pkgs.niri;
      settings = {
        prefer-no-csd = true;
        input = {
          mod-key = mainMod;

          keyboard = {
            xkb = {
              layout = "fr,us";
              options = "grp:win_space_toggle";
            };
            track-layout = "window";
            repeat-delay = 200;
            repeat-rate = 35;
            numlock = true;
          };

          touchpad = {
            natural-scroll = true;
            dwt = true;
            click-method = "button-areas";
            scroll-factor = 0.5;
          };            
        };

        overview = {
          zoom = 0.5;
        };

        xwayland-satellite = {
          enable = true;
          path = "${lib.getExe pkgs.xwayland-satellite}";
        };
      };
    };
  };
}
