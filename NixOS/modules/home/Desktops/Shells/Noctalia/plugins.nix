{ pkgs, config, ... }:

let
  noctalia-plugins = config.programs.noctalia-shell.plugins.states;
  offical-plugins = "https://github.com/noctalia-dev/noctalia-plugins";
in 
{
  home.packages = with pkgs; [
    (lib.mkIf noctalia-plugins.kde-connect.enabled kdePackages.qttools)
  ];

  programs.noctalia-shell.plugins = {
    sources = [
      {
        enable = true;
        name = "Official Noctalia Plugins";
        url = offical-plugins;
      }
    ];

    states = {
      polkit-agent = {
        enabled = true;
        sourceUrl = offical-plugins;
      };

      kde-connect = {
        enabled = true;
        sourceUrl = offical-plugins;
      };

      kaomoji-provider.enabled = true;
    };
  };
}
