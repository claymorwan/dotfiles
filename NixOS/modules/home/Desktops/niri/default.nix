{ inputs, pkgs, lib, ... }:

let
  inherit (import ../../../../variables/variables.nix)
  mainMod
  ;
in
{
  imports = [
    # inputs.niri.homeModules.niri
    ./execs.nix
    ./keybinds.nix
    ./layout.nix
    ./rules.nix
  ];

  programs = {
    niri = {

      settings = {

        input = {
          mod-key = mainMod;

          keyboard = {
            xkb = {
              layout = "fr,us";
              options = "grp:win_space_toggle";
            };
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
