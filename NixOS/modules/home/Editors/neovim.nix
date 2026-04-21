{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    withPython3 = false;
    withRuby = false;
    autowrapRuntimeDeps = false;
    
    extraPackages = with pkgs; [
      lua51Packages.lua
      lua51Packages.luarocks
      pkg-config
    ];
  };
}
