{ lib, config, host, ... }:

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
      name = mkStrVar "mewmew";
      size = lib.mkOption {
        type = lib.types.int;
        default = 24;
      };
    };

    # Dirs
    home_dir = mkStrVar "/home/${cfg.username}";
    dotfiles_dir = mkStrVar "${cfg.home_dir}/.dotfiles";
    flake_dir = mkStrVar "${cfg.dotfiles_dir}/NixOS";
    screenshot_dir = mkStrVar "${cfg.home_dir}/Pictures/Screenshots";
    submodules_dir = mkStrVar "${cfg.dotfiles_dir}/Submodules";
  
    shellAliases =
    let
      cls = "pyroclear --random";
    in
    lib.mkOption {
      type = with lib.types; attrsOf str;
      default = {
        inherit cls;
        nv = "nvim";
        sv = "sudo nvim";
        fetch = "clear; hyfetch";
        py = "python3";

        nrl = "nh os switch --hostname ${host}";
        nupd = "nh os switch --update --hostname ${host}; ${cfg.flake_dir}/dev-shells/update.nu";
      };
    };
  };
}
