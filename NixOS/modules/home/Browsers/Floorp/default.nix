{
  inputs,
  pkgs,
  lib,
  osConfig,
  ...
}:

{
  programs.floorp = {
    enable = true;

    nativeMessagingHosts = with pkgs; [
      kdePackages.plasma-browser-integration
    ];

    languagePacks = [
      "en-US"
      "fr"
    ];

    profiles = {
      default = {
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
          # "browser.uiCustomization.state" = builtins.readFile ./layout.json;
          "general.smoothScroll.msdPhysics.enabled" = true;
          "font.name.serif.x-western" = "NotoSerif Nerd Font Propo";
          "font.name.sans-serif.x-western" = "NotoSans Nerd Font Propo";
          "font.name.monospace.x-western" = "JetBrainsMono Nerd Font Mono";
          "browser.startup.homepage" = osConfig.services.omnisearch.settings.server.domain;
          # "browser.newtab.extensionControlled" = true;
          "browser.newtab.privateAllowed" = true;
          "general.autoScroll" = true;
          "extensions.autoDisableScopes" = 0;
          "sidebar.revamp" = true;
          "sidebar.verticalTabs" = true;
          "sidebar.visibility" = "expand-on-hover";

          # Workspace
          "floorp.workspaces.enabled" = true;
          "floorp.workspaces.v4.config" = builtins.readFile ./workspace-config.json;
          "floorp.workspaces.v4.store" = builtins.readFile ./workspace-store.json;
        };

        extensions = {
          force = true;

          packages = with pkgs.nur.repos.rycee.firefox-addons; [
            stylus
            firefox-color
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

            plasma-integration
            pronoundb
            catppuccin-web-file-icons
            mal-sync
            raindropio
            shinigami-eyes
            user-agent-string-switcher
            image-search-options
          ];

          settings = {
            # Stylus
            "{7a7a4a92-a2a0-41d1-9fd7-1e92480d612d}".settings = {
              dbInChromeStorage = true; # required for Stylus
            };

            # uBlock Origin
            "uBlock0@raymondhill.net".settings = {
              selectedFilterLists = [
                "ublock-filters"
                "ublock-badware"
                "ublock-privacy"
                "ublock-unbreak"
                "ublock-quick-fixes"
              ];
            };
          };
        };
      };
    };
  };
}
