{
  inputs,
  pkgs,
  lib,
  osConfig,
  ...
}:

{
  imports = [
    inputs.waterfox.homeModules.default
  ];

  programs.waterfox = {
    enable = true;
    # setAsDefaultBrowser = true;

    nativeMessagingHosts = with pkgs; [
      kdePackages.plasma-browser-integration
    ];

    policies = {
      LegacyProfiles = true;
    };

    languagePacks = [
      "en-US"
      "fr"
    ];

    profiles = {
      default = {
        id = 0;
        name = "default";
        isDefault = true;

        search = {
          force = true;
          default = "omnisearch";
          engines = {
            omnisearch = lib.mkIf osConfig.services.omnisearch.enable {
              name = "OmniSearch";
              icon = "${inputs.omnisearch}/static/favicon.ico";
              definedAliases = [ "@om" ];
              urls = [
                {
                  template = "${osConfig.services.omnisearch.settings.server.domain}/search?q={searchTerms}";
                  params = [
                    {
                      name = "query";
                      value = "searchTerms";
                    }
                  ];
                }
              ];
            };
          };
        };

        settings = {
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "services.sync.prefs.sync.browser.uiCustomization.state" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.toolbars.bookmarks.visibility" = "always";
          # "browser.uiCustomization.state" = lib.toJSON (lib.importJSON ./layout.json);
          "general.smoothScroll.msdPhysics.enabled" = true;
          # "font.name.serif.x-western" = "NotoSerif Nerd Font Propo";
          # "font.name.sans-serif.x-western" = "NotoSans Nerd Font Propo";
          # "font.name.monospace.x-western" = "JetBrainsMono Nerd Font Mono";
          # "browser.startup.homepage" = osConfig.services.omnisearch.settings.server.domain;
          "browser.newtab.extensionControlled" = true;
          "browser.newtab.privateAllowed" = true;
          "general.autoScroll" = true;
          "extensions.autoDisableScopes" = 0;

        };

        extensions = {
          force = true;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            stylus
            ublock-origin
            proton-pass
            darkreader
            indie-wiki-buddy
            
            protondb-for-steam
            steam-database

            control-panel-for-twitter
            control-panel-for-youtube
            seventv
            enhancer-for-youtube
            youtube-no-translation
            ambient-light-for-youtube

            plasma-integration
            pronoundb
            catppuccin-web-file-icons
            mal-sync
            raindropio
            shinigami-eyes
            user-agent-string-switcher
            image-search-options
          ];
        };
      };
    };

  };
}
