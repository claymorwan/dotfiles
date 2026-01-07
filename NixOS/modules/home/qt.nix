{
  pkgs,
  config,
  ...
}:

let
  qtctSettings = {
    Appearance = {
      icon_theme = config.gtk.iconTheme.name;
    };
  };
in
{
  home.packages = with pkgs; [
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];

  qt = {
    enable = true;
    platformTheme.name = "qtct";
    style = {
      name = "kvantum";
      # package = pkgs.darkly;
    };

    qt5ctSettings = qtctSettings;
    qt6ctSettings = qtctSettings;
  };
}
