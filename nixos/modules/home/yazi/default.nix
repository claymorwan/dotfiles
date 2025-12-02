{ pkgs, ... }:

let
  settings = import ./yazi.nix;
  keymap = import ./keymap.nix;
  #theme = import ./theme.nix;
  claymorwan-plugin = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "claymorwan";
    repo = "yazi-plugins";
    rev = "49b134d972ace3a3144e34465b7e153412116255";
    hash = "sha256-6Rb9IIiCl3NuO91jsWqZcAKMzP0Qo+fNq3WuglHejnk=";
  };
in
{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    settings = settings;
    keymap = keymap;
    #theme = theme;
    initLua = ./init.lua;

    plugins = {
      lazygit = pkgs.yaziPlugins.lazygit;
      full-border = pkgs.yaziPlugins.full-border;
      git = pkgs.yaziPlugins.git;
      chmod = pkgs.yaziPlugins.chmod;
      starship = pkgs.yaziPlugins.starship;
      compress = pkgs.yaziPlugins.compress;
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
      ouch = pkgs.yaziPlugins.ouch;
      lutris = "${claymorwan-plugin}/lutris.yazi";
      shell = "${claymorwan-plugin}/shell.yazi";
      yamb = pkgs.fetchFromGitHub {
        owner = "h-hg";
        repo = "yamb.yazi";
        rev = "22af0033be18eead7b04c2768767d38ccfbaa05b";
        hash = "sha256-NMxZ8/7HQgs+BsZeH4nEglWsRH2ibAzq7hRSyrtFDTA=";
      };
    };
  };
  
  # Packages for plugins
  home.packages = with pkgs; [
    ouch
  ];
}
