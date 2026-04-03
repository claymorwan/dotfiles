{ pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim

      astrocore
      astroui
      astrolsp
    ];

    extraPackages = with pkgs; [
      lua51Packages.lua
      lua51Packages.luarocks
      pkg-config
    ];

    # extraLuaConfig = ''
    #  require("lazy").setup({
    #    -- disable all update / install features
    #    -- this is handled by nix
    #    rocks = { enabled = false },
    #    pkg = { enabled = false },
    #    install = { missing = false },
    #    change_detection = { enabled = false },
    #    spec = {
    #      -- TODO
    #    },
    #  })
    #'';
  };
}
