{ inputs, pkgs, config, ... }:

{
  imports = [
    inputs.dms.nixosModules.greeter
  ];

  programs = {
    dank-material-shell = {
      greeter = {
        enable = true;
        compositor.name = "niri";

        configHome = config.globVars.home_dir;
        configFiles = [
          "${config.globVars.dotfiles_dir}/Configs/dms/.config/DankMaterialShell/settings.json"
        ];
      };
    };
  };

  # Needed to make custom cursor work
  environment = {
    etc."greetd/niri_overrides.kdl".text = ''
      input {
        keyboard {
          xkb {
            layout "fr,us"
            options "grp:win_space_toggle"
          }
        }
      }

      cursor {
        xcursor-theme "${config.globVars.mouse_cursor}"
        xcursor-size 24
      }
    '';
  };
}
