{ inputs, lib, pkgs, osConfig, host, ... }:

{
  imports = [
    inputs.devenvcp.homeModules.default

    ./helix.nix
    #./neovim.nix
  ]
  ++ (lib.optionals (host != "android") [./desktop.nix])
  ;
  
  programs = {
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
    gh
  ];
}
