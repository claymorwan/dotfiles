#TODO clean up this mess, qt theming with nix is lowkey harder than i thought lol

{ pkgs, lib, config, osConfig, ... }:

let
  qtctSettings = {
    Appearance = {
      style = "kvantum-dark";
      # custom_palette = true;
      icon_theme = config.gtk.iconTheme.name;
      standard_dialogs = "xdgdesktopportal";
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
      # name = "kvantum-dark";
      package = with pkgs; [
        darkly
        # darkly-qt5
        kdePackages.breeze
      ];
    };

    qt5ctSettings = qtctSettings;
    # lib.recursiveUpdate qtctSettings { 
    #   Appearance.color_scheme_path = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/catppuccin-${osConfig.globVars.ctp_flavor}-${osConfig.globVars.ctp_accent}.conf";
    # };

    qt6ctSettings = qtctSettings;
    # lib.recursiveUpdate qtctSettings {
    #   Appearance.color_scheme_path = "${pkgs.catppuccin-qt5ct}/share/qt6ct/colors/catppuccin-${osConfig.globVars.ctp_flavor}-${osConfig.globVars.ctp_accent}.conf";
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
          flavour = [ osConfig.globVars.ctp_flavor ];
          accents = [ osConfig.globVars.ctp_accent ];
        }}/share/color-schemes/CatppuccinMochaMauve.colors");
    };
  in {
    configFile = {
      "Kvantum/libadwaita-kde-mocha-mauve".source =
        "${(pkgs.callPackage ./libadwaita-kde.nix { inherit (osConfig.globVars) ctp_flavor ctp_accent;} )}/share/Kvantum/libadwaita-kde-${osConfig.globVars.ctp_flavor}-${osConfig.globVars.ctp_accent}";
      "Kvantum/kvantum.kvconfig".text = ''
        [General]
        theme=libadwaita-kde-${osConfig.globVars.ctp_flavor}-${osConfig.globVars.ctp_accent}
      '';
      
      # KDE theme
      "kdeglobals" = kdeTheme;
    };

    dataFile."krita/color-schemes/CatppuccinMochaMauve.colors" = kdeTheme;
  };
}
