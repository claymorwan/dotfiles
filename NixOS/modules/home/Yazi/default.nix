{ inputs, pkgs, ... }:

let
  settings = import ./yazi.nix;
  keymap = import ./keymap.nix;
  #theme = import ./theme.nix;
  claymorwan-plugin = pkgs.fetchFromGitea {
    domain = "codeberg.org";
    owner = "claymorwan";
    repo = "yazi-plugins";
    rev = "1a7a20aca94d03db769794ca141dab19f6dcb237";
    hash = "sha256-HCYhuAMhvmv4hkX0loLJLhC0/Z5XGn2HIJbx2whxJYc=";
  };
in
{
  # imports = [
  #   (inputs.nix-yazi-plugins.legacyPackages.x86_64-linux.homeManagerModules.default)
  # ];

  programs.yazi = {
    enable = true;
    package = pkgs.yazi.override {_7zz = pkgs._7zz-rar; };

    enableZshIntegration = true;
    enableBashIntegration = true;
    enableFishIntegration = true;
    shellWrapperName = "y";
    settings = settings;
    keymap = keymap;
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
      yamb = pkgs.fetchFromGitHub {
        owner = "h-hg";
        repo = "yamb.yazi";
        rev = "5f2e22e784dd5fc830cd85885a6d1d6690b52298";
        hash = "sha256-3Cp3+v0laSVsDdTyG26EOh2xt18ER8P9Nla9vtRuj9k=";
      };
      krita-preview = pkgs.fetchFromGitHub {
        owner = "walldmtd";
        repo = "krita-preview.yazi";
        rev = "2a1e66ef41d6c8b70ca13d9021f6a1a7e14f4c63";
        hash = "sha256-7C7Bsb8nKFMxqwIHHyU6hw5qdkaHVmUPIN2g2j9gTEY=";
      };
    };
  };
}
