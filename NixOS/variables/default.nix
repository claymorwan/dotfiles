{ lib, config, ... }:

let
  cfg = config.globVars;
  
  # Most of them are str vars so this will make it faster
  mkStrVar = var:
    lib.mkOption {
      type = lib.types.str;
      default = var;
    };

  # for "enable" var
  mkBoolVar = var:
    lib.mkOption {
      type = lib.types.bool;
      default = var;
    };
in 
{
  options.globVars = {
    username = mkStrVar "claymorwan";
    mainMod = mkStrVar "SUPER";

    # Theming
    ctp_flavor = mkStrVar "mocha";
    ctp_accent = mkStrVar "mauve";
    font_family = mkStrVar "JetBrainsMono Nerd Font";
    mouseCursor = {
      name = mkStrVar "akita-neru";
      size = lib.mkOption {
        type = lib.types.int;
        default = 24;
      };
    };

    # Apps
    launch_prefix = mkStrVar "app2unit --";
    terminal = mkStrVar "ghostty";
    browser = mkStrVar "zen-beta"; # "MOZ_LEGACY_PROFILES=1 zen-beta";
    discord = mkStrVar "equibop --wayland";

    # Dirs
    home_dir = mkStrVar "/home/${cfg.username}";
    dotfiles_dir = mkStrVar "${cfg.home_dir}/.dotfiles";
    flake_dir = mkStrVar "${cfg.dotfiles_dir}/NixOS";
    screenshot_dir = mkStrVar "${cfg.home_dir}/Pictures/Screenshots";
    submodules_dir = mkStrVar "${cfg.dotfiles_dir}/Submodules";
  
    # enable
    enableNiri = mkBoolVar true;
    enableHyprland = mkBoolVar false;
  };
}
