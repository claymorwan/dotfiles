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
  imports = [
    ./options.nix
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

    kvantum = {
      enable = true;
      qt5.enable = true;

      themes = with pkgs; [
        (pkgs.callPackage ./libadwaita-kde.nix { inherit (osConfig.globVars) ctp_flavor ctp_accent; })
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
      # KDE theme
      "kdeglobals" = kdeTheme;
      # "kdenliverc".source = ./kdenliverc;
    };

    dataFile."krita/color-schemes/CatppuccinMochaMauve.colors" = kdeTheme;
  };
}
