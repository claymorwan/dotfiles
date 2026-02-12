#TODO clean up this mess, qt theming with nix is lowkey harder than i thought lol

{ pkgs, lib, config, ... }:

let
  qtctSettings = {
    Appearance = {
      style = "kvantum-dark";
      # custom_palette = true;
      icon_theme = config.gtk.iconTheme.name;
      standard_dialogs = "xdgdesktopportal";
    };
  };

  inherit (import ../../../../variables)
  ctp_flavor
  ctp_accent
  ;
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
      # name = "kvantum-dark";
      package = with pkgs; [
        darkly
        darkly-qt5
        kdePackages.breeze
      ];
    };

    qt5ctSettings = qtctSettings;
    # lib.recursiveUpdate qtctSettings { 
    #   Appearance.color_scheme_path = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/catppuccin-${ctp_flavor}-${ctp_accent}.conf";
    # };

    qt6ctSettings = qtctSettings;
    # lib.recursiveUpdate qtctSettings {
    #   Appearance.color_scheme_path = "${pkgs.catppuccin-qt5ct}/share/qt6ct/colors/catppuccin-${ctp_flavor}-${ctp_accent}.conf";
    # };
  };

  xdg = let
    kdeTheme = {
      enable = true;
      text = ''
        [UiSettings]
        ColorScheme=*
      ''
      + (builtins.readFile "${
        pkgs.catppuccin-kde.override {
          flavour = [ ctp_flavor ];
          accents = [ ctp_accent ];
        }}/share/color-schemes/CatppuccinMochaMauve.colors");
    };
  in {
    configFile = {
      "Kvantum/libadwaita-kde-mocha-mauve".source =
        "${(pkgs.callPackage ./libadwaita-kde.nix { })}/share/Kvantum/libadwaita-kde-${ctp_flavor}-${ctp_accent}";
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=libadwaita-kde-${ctp_flavor}-${ctp_accent}
      '';
      
      # KDE theme
      "kdeglobals" = kdeTheme;
    };

    dataFile."krita/color-schemes/CatppuccinMochaMauve.colors" = kdeTheme;
  };
}
