{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages = with pkgs; [
      lua51Packages.lua
      lua51Packages.luarocks
      pkg-config
    ];
  };
}
