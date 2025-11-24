{ pkgs, config, lib, ... }:

{
  home.packages = with pkgs; [
  ];
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };
}
