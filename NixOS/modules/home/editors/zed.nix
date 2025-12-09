{ ... }:

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

      icon_theme = "Catppuccin Mocha";

      theme = {
        dark = "Catppuccin Mocha";
        light = "Catppuccin Mocha";
      };
    };
  };
}
