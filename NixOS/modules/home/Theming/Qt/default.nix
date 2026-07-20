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

  ctp-kde-pkg = pkgs.catppuccin-kde.override {
      flavour = [ osConfig.globVars.ctp_flavor ];
      accents = [ osConfig.globVars.ctp_accent ];
  };
in
{
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

    kvantum = {
      enable = true;
      qt5.enable = true;

      themes = with pkgs; [
        (callPackage ./libadwaita-kde.nix { inherit (osConfig.globVars) ctp_flavor ctp_accent; })
      ];

      settings.General.theme = "libadwaita-kde-${osConfig.globVars.ctp_flavor}-${osConfig.globVars.ctp_accent}";
    };

    qt5ctSettings = qtctSettings;
    # lib.recursiveUpdate qtctSettings { 
    #   Appearance.color_scheme_path = "${pkgs.catppuccin-qt5ct}/share/qt5ct/colors/catppuccin-${osConfig.globVars.ctp_flavor}-${osConfig.globVars.ctp_accent}.conf";
    # };

    qt6ctSettings = qtctSettings;
    # lib.recursiveUpdate qtctSettings {
    #   Appearance.color_scheme_path = "${pkgs.catppuccin-qt5ct}/share/qt6ct/colors/catppuccin-${osConfig.globVars.ctp_flavor}-${osConfig.globVars.ctp_accent}.conf";
    # };

    kde.settings = {
      kdeglobals = {
        UiSettings = {
          ColorScheme = "CatppuccinMochaMauve";
          ColorSchemePath = "${ctp-kde-pkg}/share/color-scheme/CatppuccinMochaMauve.colors";
        };
      };

      kdenliverc = {
        General = {
          ColorScheme = "CatppuccinMochaMauve";
          ColorSchemePath = "${ctp-kde-pkg}/share/color-scheme/CatppuccinMochaMauve.colors";
        };
      };
    };
  };

  # xdg =
  # let
  #   kdeTheme = {
  #     enable = true;
  #     text = ''
  #       [UiSettings]
  #       ColorScheme=*
  #     ''
  #     + (builtins.readFile "${
  #       pkgs.catppuccin-kde.override {
  #         flavour = [ osConfig.globVars.ctp_flavor ];
  #         accents = [ osConfig.globVars.ctp_accent ];
  #       }}/share/color-schemes/CatppuccinMochaMauve.colors");
  #   };
  # in
  # {
    # configFile = {
    #   # KDE theme
    #   "kdedefaults/kdeglobals".text = ''
    #     [General]
    #     ColorScheme=CatppuccinMochaMauve
        
    #     [Icons]
    #     Theme=${config.gtk.iconTheme.name}

    #     [KDE]
    #     widgetStyle=Breeze
    #   '';
    #   # "kdenliverc".source = ./kdenliverc;
    # };

  #   dataFile = {
  #     # "krita/color-schemes/CatppuccinMochaMauve.colors" = kdeTheme;

  #     "color-schemes/CatppuccinMochaMauve".source = "${pkgs.catppuccin-kde.override {
  #       flavour = [ osConfig.globVars.ctp_flavor ];
  #       accents = [ osConfig.globVars.ctp_accent ];
  #     }}/share/color-schemes/CatppuccinMochaMauve.colors";
  #   };
  # };
}
