{ pkgs, inputs, config, ... }:

let
  version = "beta";
  ctp_zen = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "zen-browser";
    rev = "c855685442c6040c4dda9c8d3ddc7b708de1cbaa";
    hash = "sha256-5A57Lyctq497SSph7B+ucuEyF1gGVTsuI3zuBItGfg4=";
  };
  inherit (import ../../variables)
    submodules_dir
    ;
in
{
  imports = [
    inputs.zen-browser.homeModules.${version}
  ];

  programs.zen-browser = {
    enable = true;

    nativeMessagingHosts = with pkgs; [
      kdePackages.plasma-browser-integration
    ];

    policies = {
      LegacyProfiles = true;
    };

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;
        settings = {
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "services.sync.prefs.sync.browser.uiCustomization.state" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.toolbars.bookmarks.visibility" = "always";
          "browser.uiCustomization.state" = builtins.readFile ./layout.json;
          "general.smoothScroll.msdPhysics.enabled" = true;

          # Zen specific options
          "zen.view.use-single-toolbar" = false;
          "zen.urlbar.replace-newtab" = false;
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.hide-toolbar" = true;
          "zen.view.compact.enable-at-startup" = true;

          # Mods
          #- Advanced Tab Groups
          "browser.tabs.groups.enabled" = true;
          #- Audio wave
          "zen.mods.AudioIndicatorEnhanced.returnOldIcons" = false;
          "zen.mods.AudioIndicatorEnhanced.audioWave.enabled" = true;
          #- Better find bar
          "theme-better_find_bar-enable_custom_background" = true;
          "theme.better_find_bar.custom_background" = "#1E1E2E";
          #- Context menu icon
          "cmi-Switch-Icon-Package" = 2;
          #- Tidy popup
          "mod.tidypopup.usecustomhovercolor" = true;
          "mod.tidypopup.hovercolor" = "#313244"; #"rgba(203, 166, 247, 1)"
        };

        sine.enable = true;
      };
    };

  };

  home.file.".zen/default/chrome" = {
    enable = true;
    source = "${ctp_zen}/themes/Mocha/Mauve";
    recursive = true;
  };

  xdg.mimeApps =
    let
      value =
        let
          zen-browser = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.${version};
        in
        zen-browser.meta.desktopFileName;

      associations = builtins.listToAttrs (
        map
          (name: {
            inherit name value;
          })
          [
            "application/x-extension-shtml"
            "application/x-extension-xhtml"
            "application/x-extension-html"
            "application/x-extension-xht"
            "application/x-extension-htm"
            "x-scheme-handler/unknown"
            "x-scheme-handler/mailto"
            "x-scheme-handler/chrome"
            "x-scheme-handler/about"
            "x-scheme-handler/https"
            "x-scheme-handler/http"
            "application/xhtml+xml"
            "application/json"
            "text/plain"
            "text/html"
          ]
      );
    in
    {
      associations.added = associations;
      defaultApplications = associations;
    };

}
