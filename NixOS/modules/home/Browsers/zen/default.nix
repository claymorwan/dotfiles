{
  pkgs,
  inputs,
  config,
  ...
}:

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
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;

    # package = let   
    #   custom-zen = inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta-unwrapped.overrideAttrs (oldAttrs: rec {
    #     makeDesktopItem = oldAttrs.exec // "${oldAttrs.binaryName} -p default %u";
    #   });
    # in 
    # (config.lib.nixGL.wrap ((pkgs.wrapFirefox) custom-zen {}));

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


          "zen.view.use-single-toolbar" = false;
          "zen.urlbar.replace-newtab" = false;
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.hide-toolbar" = true;
          "zen.view.compact.enable-at-startup" = true;
        };

        mods = [
          # Better Find Bar
          "a6335949-4465-4b71-926c-4a52d34bc9c0"

          # SuperPins
          "ad97bb70-0066-4e42-9b5f-173a5e42c6fc"

          # Audio Indicator Enhanced
          "2317fd93-c3ed-4f37-b55a-304c1816819e"

          # Pimp your PiP
          "599a1599-e6ab-4749-ab22-de533860de2c"

          # Trackpad Animation
          "8039de3b-72e1-41ea-83b3-5077cf0f98d1"

          # Ghost Tabs
          "c01d3e22-1cee-45c1-a25e-53c0f180eea8"

          # Vertical Split Tab Groups
          "4c2bec61-7f6c-4e5c-bdc6-c9ad1aba1827"

          # Tab Preview Enhanced
          "87196c08-8ca1-4848-b13b-7ea41ee830e7"

          # Better Active Tab
          "d8b79d4a-6cba-4495-9ff6-d6d30b0e94fe"

          # Better CtrlTab Panel
          "72f8f48d-86b9-4487-acea-eb4977b18f21"
        ];
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
