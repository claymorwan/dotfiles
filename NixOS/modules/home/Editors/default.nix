{ inputs, pkgs, osConfig, ... }:

{
  imports = [
    inputs.devenvcp.homeModules.default

    ./helix.nix
    ./jetbrains.nix
    #./neovim.nix
    ./zed.nix
  ];

  programs = {
    godot = {
      enable = true;
      package = pkgs.godot-mono;
      exportTemplates = with pkgs; [
        godotPackages.export-templates-mono-bin
      ];
    };

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    devenvcp = {
      enable = true;
      defaultPath = "${osConfig.globVars.flake_dir}/dev-shells/devenv";
    };
    
    devenv.enable = true;
    jq.enable = true;
  };

  home.packages = with pkgs; [
    neovim
    sqlitebrowser
    distrobox
    boxbuddy
    unityhub
    utmt-cli
    gitte
  ];
}
