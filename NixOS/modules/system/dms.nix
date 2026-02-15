{ inputs, pkgs, username, ... }:

let
  inherit (import ../../variables)
    home_dir
    dotfiles_dir
    mouse_cursor
    ;
in
{
  imports = [
    inputs.dms.nixosModules.greeter
  ];

  programs = {
    dank-material-shell = {
      greeter = {
        enable = true;
        compositor.name = "niri";

        configHome = "${home_dir}";
        configFiles = [
          "${dotfiles_dir}/Configs/dms/.config/DankMaterialShell/settings.json"
        ];
      };
    };
  };

  # Needed to make custom cursor work
  environment = {
    systemPackages = [ (pkgs.callPackage ../../pkgs/cursors { }) ];
    etc."greetd/niri_overrides.kdl".text = ''
      cursor {
        xcursor-theme "${mouse_cursor}"
        xcursor-size 24
      }
    '';
  };
}
