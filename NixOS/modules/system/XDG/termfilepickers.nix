{
  inputs,
  lib,
  pkgs,
  ...
}:

let
  inherit (import ../../../variables)
    home_dir
    ;
in
{
  imports = [ inputs.xdp-termfilepickers.nixosModules.default ];

  services.xdg-desktop-portal-termfilepickers =
    let
      termfilepickers = inputs.xdp-termfilepickers.packages.${pkgs.stdenv.hostPlatform.system}.default;
    in
    {
      enable = true;
      package = termfilepickers;
      desktopEnvironments = [
        "common"
        "hyprland"
        "niri"
      ];
      config = {
        # open_file_script_path = "${inputs.xdp-termfilepickers}/data/share/wrappers/yazi-open-file.nu";
        # save_file_script_path = "${inputs.xdp-termfilepickers}/data/share/wrappers/yazi-save-file.nu";
        # save_files_script_path = "${inputs.xdp-termfilepickers}/data/share/wrappers/yazi-save-file.nu";
        terminal_command = [
          (lib.getExe pkgs.ghostty)
          "--title=terminal-filepicker"
          "-e"
        ];
      };
    };
}
