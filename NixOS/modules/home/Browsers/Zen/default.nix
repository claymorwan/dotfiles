{ inputs, pkgs, config, ... }:

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

    suppressXdgMigrationWarning = true;

    profiles = {
      default = let
        containers = {
          Main = {
            color = "green";
            icon = "tree";
            id = 1;
          };
        };

        spaces = {
          Default = {
            id = "572910e1-4468-4832-a669-0b3a93e2f165";
            icon = "✨";
            position = 1000;
            # container = containers.Main.id;
          };

          "Nerd stuff" = {
            id = "42fb3bdc-65e7-4df0-bf85-6608411417c1";
            icon = "🖥️";
            position = 1001;
          };

          Work = {
            id = "a395bfd6-baaa-451f-98f0-b6001dc4b616";
            icon = "📚";
            position = 1002;
          };

          "𝓯𝓻𝓮𝓪𝓴" = {
            id = "9c1fa423-c2ae-413b-964b-2d7f77e8792e";
            # icon = " ";
            position = 1003;
          };
        };

        pins = {
          youtube = {
            id = "21387aaf-f9f6-461f-9932-2cda4edbe952";
            url = "https://www.youtube.com/";
            isEssential = true;
            position = 101;
          };

          twitter = {
            id = "7c1c6fd1-f12d-427b-a0df-b161723afdb0";
            url = "https://www.twitter.com/";
            isEssential = true;
            position = 102;
          };

          bluesky = {
            id = "2f8dbc15-93eb-4cc5-8677-029fa2cc7f9a";
            url = "https://bsky.app/";
            isEssential = true;
            position = 103;
          };

          soundclouds = {
            id = "c434a171-b645-4df3-b909-38e954d47f23";
            url = "https://soundcloud.com/";
            isEssential = true;
            position = 104;
          };

          whatsapp = {
            id = "2a0b3560-421f-42ec-82da-e9e15484b7eb";
            url = "https://web.whatsapp.com/";
            isEssential = true;
            position = 105;
          };

          teams = {
            id = "c434a171-b645-4df3-b909-38e954d47f22";
            url = "https://teams.microsoft.com/v2/";
            workspace = spaces.Work.id;
            position = 200;
          };

          raindrop = {
            id = "e2fb6e27-e4fe-45a5-afd0-43da55d2674c";
            url = "https://app.raindrop.io/";
            workspace = spaces."𝓯𝓻𝓮𝓪𝓴".id;
            position = 201;
          };
        };
      in {
        id = 0;
        name = "default";
        isDefault = true;

        # containersForce = true;
        spacesForce = true;
        pinsForce = true;
        inherit spaces pins;
        settings = {
          "widget.use-xdg-desktop-portal.file-picker" = 1;
          "services.sync.prefs.sync.browser.uiCustomization.state" = true;
          "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
          "browser.toolbars.bookmarks.visibility" = "always";
          "browser.uiCustomization.state" = builtins.readFile ./layout.json;
          "general.smoothScroll.msdPhysics.enabled" = true;
          "font.name.serif.x-western" = "NotoSerif Nerd Font Propo";
          "font.name.sans-serif.x-western" = "NotoSans Nerd Font Propo";
          "font.name.monospace.x-western" = "JetBrainsMono Nerd Font Mono";

          # Zen specific options
          "zen.view.use-single-toolbar" = false;
          "zen.urlbar.replace-newtab" = false;
          "zen.urlbar.behavior" = "float";
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.hide-toolbar" = true;
          "zen.view.compact.enable-at-startup" = true;

          # Mods
          "sine.engine.auto-update" = false;
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
          #- Neo Zen
          "neo-features-bottom-disabled" = true;
          "neo-features-bottom-at-bottom" = true;
          "neo-theme-background-enabled" = true;
          "neo-external-nebula-animations-tabs-disabled" = true;
          #- Tidy popup
          "mod.tidypopup.usecustomhovercolor" = true;
          "mod.tidypopup.hovercolor" = "#313244";
        };

        sine = {
          enable = true;
          mods = [
            # Sine
            "advanced-tab-groups"
            "context-menu-icons"
            "floating-statusbar"
            "Neo-Zen"
            ## Deta Loading Bar
            "c9ee0d97-d2d6-40fd-8f85-549fe000b868"

            # Zen
            ## Audio Indicator Enhanced
            "2317fd93-c3ed-4f37-b55a-304c1816819e"
            ## Vertical Split Tab Groups
            "4c2bec61-7f6c-4e5c-bdc6-c9ad1aba1827"
            ## Pimp your PiP
            "599a1599-e6ab-4749-ab22-de533860de2c"
            ## Tidy Popup
            "79dde383-4fe7-404a-a8e6-9be440022542"
            ## Trackpad Animation
            "8039de3b-72e1-41ea-83b3-5077cf0f98d1"
            ## Better Find Bar
            # "a6335949-4465-4b71-926c-4a52d34bc9c0"
            ## SuperPins
            "ad97bb70-0066-4e42-9b5f-173a5e42c6fc"
            ## Better Unloaded Tabs
            "f7c71d9a-bce2-420f-ae44-a64bd92975ab"
          ];
        };
      };
    };

  };

  home.file.".config/zen/default/chrome" = {
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
