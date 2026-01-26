{ ... }:

let
  inherit (import ../../../variables)
    font_family
    ;
in
{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
      "lua"
    ];
    mutableUserSettings = false;
    userSettings = {
      base_keymap = "JetBrains";

      auto_install_extensions = {
        catppuccin-icons = true;
      };

      buffer_font_family = font_family;

      icon_theme = "Catppuccin Mocha";

      theme = {
        dark = "Catppuccin Mocha";
        light = "Catppuccin Mocha";
      };
    };
  };
}
