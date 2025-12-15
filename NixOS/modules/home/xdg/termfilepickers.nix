{
  inputs,
  lib,
  pkgs,
  system,
  ...
}:

let
  inherit (import ../../../variables/variables.nix)
    home_dir
    ;
in
{
  imports = [ inputs.xdp-termfilepickers.homeManagerModules.default ];

  services.xdg-desktop-portal-termfilepickers =
    let
      termfilepickers = inputs.xdp-termfilepickers.packages.${system}.default;
    in
    {
      enable = true;
      package = termfilepickers;
      desktopEnvironments = [
        "common"
        "hyprland"
      ];
      config = {
        # open_file_script_path = "${home_dir}/.config/xdg-desktop-portal-termfilepickers/yazi-open-file.nu";
        # save_file_script_path = "${home_dir}/.config/xdg-desktop-portal-termfilepickers/yazi-save-file.nu";
        # save_files_script_path = "${home_dir}/.config/xdg-desktop-portal-termfilepickers/yazi-save-file.nu";
        terminal_command = [
          (lib.getExe pkgs.ghostty)
          "--title=terminal-filechooser"
          "-e"
        ];
      };
    };
}
