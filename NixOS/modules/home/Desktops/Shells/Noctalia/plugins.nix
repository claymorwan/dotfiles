let
  offical-plugins = "https://github.com/noctalia-dev/noctalia-plugins";
in 
{
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
