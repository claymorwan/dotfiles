{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = true;
    withRuby = true;

    extraPackages = with pkgs; [
      lua51Packages.lua
      lua51Packages.luarocks
      pkg-config
    ];
  };
}
