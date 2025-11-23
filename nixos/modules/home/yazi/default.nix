{ pkgs, ... }:

let
  settings = import ./yazi.nix;
  keymap = import ./keymap.nix;
  #theme = import ./theme.nix;
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
    plugins = {
      lazygit = pkgs.yaziPlugins.lazygit;
      full-border = pkgs.yaziPlugins.full-border;
      git = pkgs.yaziPlugins.git;
      chmod = pkgs.yaziPlugins.chmod;
      starship = pkgs.yaziPlugins.starship;
      compress = pkgs.yaziPlugins.compress;
    };
    initLua = ''
      require("full-border"):setup()
         require("git"):setup()
    '';
  };
}
