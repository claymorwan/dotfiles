{ pkgs, inputs, system, ... }:

{
  # home.nix
  imports = [
    inputs.zen-browser.homeModules.beta
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;
  
    policies = let
      mkLockedAttrs = builtins.mapAttrs (_: value: {
        Value = value;
        Status = "locked";
      });
    in {
      Preferences = mkLockedAttrs {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        # and so on...
      };
    };
  };
}

