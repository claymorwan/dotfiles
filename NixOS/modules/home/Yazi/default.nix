{ pkgs, ... }:

let
  claymorwan-plugin = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "claymorwan";
    repo = "yazi-plugins";
    rev = "bdb3b97eeaf8e6a3e76c1dcdc0f4acee89070473";
    hash = "sha256-uBfTjQ3LjLaPP9n7nffgULrPTJYzDz97mBrtsv16yYE=";
  };
in
{
  imports = [
    ./yazi.nix
    ./keymap.nix
  ];
  
  programs.yazi = {
    enable = true;

    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    initLua = ./init.lua;

    extraPackages = with pkgs; [
      ouch
      glow
    ];

    plugins = {
      toggle-pane = pkgs.yaziPlugins.toggle-pane;
      lazygit = pkgs.yaziPlugins.lazygit;
      full-border = pkgs.yaziPlugins.full-border;
      git = pkgs.yaziPlugins.git;
      chmod = pkgs.yaziPlugins.chmod;
      mount = pkgs.yaziPlugins.mount;
      starship = pkgs.yaziPlugins.starship;
      compress = pkgs.yaziPlugins.compress;
      wl-clipboard = pkgs.yaziPlugins.wl-clipboard;
      ouch = pkgs.yaziPlugins.ouch;
      glow = pkgs.yaziPlugins.glow;
      lutris = "${claymorwan-plugin}/lutris.yazi";
      shell = "${claymorwan-plugin}/shell.yazi";
      krita-preview = pkgs.fetchFromGitHub {
        owner = "walldmtd";
        repo = "krita-preview.yazi";
        rev = "2a1e66ef41d6c8b70ca13d9021f6a1a7e14f4c63";
        hash = "sha256-7C7Bsb8nKFMxqwIHHyU6hw5qdkaHVmUPIN2g2j9gTEY=";
      };
    };
  };
}
