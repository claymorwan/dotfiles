{ inputs, pkgs, lib, ... }:

{
  imports = [ inputs.xdp-termfilepickers.nixosModules.default ];

  services.xdg-desktop-portal-termfilepickers = {
    # enable = true;
    package = inputs.xdp-termfilepickers.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
      replaceYazi = false;
    };

    desktopEnvironments = [
      "common"
      "hyprland"
      "niri"
    ];

    config = {
      terminal_command = [
        (lib.getExe pkgs.ghostty)
        "--title=terminal-filepicker"
        "-e"
      ];
    };
  };
}
