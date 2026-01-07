{
  pkgs,
  inputs,
  config,
  stdenv,
  ...
}:

let
  version = "beta";
  # inherit version;
  ctp_zen = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "zen-browser";
    rev = "c855685442c6040c4dda9c8d3ddc7b708de1cbaa";
    hash = "sha256-5A57Lyctq497SSph7B+ucuEyF1gGVTsuI3zuBItGfg4=";
  };
  inherit (import ../../variables/variables.nix)
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
    #     libName = "zen-bin-1.17.15b";
    #       fsautoconfig = (
    #         builtins.fetchurl {
    #           url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/master/program/config.js";
    #           sha256 = "1mx679fbc4d9x4bnqajqx5a95y1lfasvf90pbqkh9sm3ch945p40";
    #         }
    #       );
    #       configpref = (
    #         builtins.fetchurl {
    #           url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/refs/heads/master/program/defaults/pref/config-prefs.js";
    #           sha256 = "sha256-a/0u0TnRj/UXjg/GKjtAWFQN2+ujrckSwNae23DBfs4=";
    #         }
    #       );
    #
    #       postInstall = (oldAttrs.postInstall or "") + ''
    #         chmod -R u+w "$out/lib/${libName}"
    #         cp "${fsautoconfig}" "$out/lib/${libName}/config.js"
    #         mkdir -p "$out/lib/${libName}/defaults/pref"
    #         cp "${configpref}" "$out/lib/${libName}/defaults/pref/config-pref.js"
    #       '';
    #   });
    # in
    # (config.lib.nixGL.wrap ((pkgs.wrapFirefox) custom-zen {}));

    # extraPrefsFiles = [
    #   (builtins.fetchurl {
    #     url = "https://raw.githubusercontent.com/MrOtherGuy/fx-autoconfig/master/program/config.js";
    #     sha256 = "1mx679fbc4d9x4bnqajqx5a95y1lfasvf90pbqkh9sm3ch945p40";
    #   })
    # ];

    nativeMessagingHosts = with pkgs; [
      kdePackages.plasma-browser-integration
    ];

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

          "zen.view.use-single-toolbar" = false;
          "zen.urlbar.replace-newtab" = false;
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.hide-toolbar" = true;
          "zen.view.compact.enable-at-startup" = true;
        };
      };
    };

  };

  home.file = {
    ".zen/default/chrome/userChrome.css" = {
      enable = true;
      source = "${ctp_zen}/themes/Mocha/Mauve/userChrome.css";
    };
    ".zen/default/chrome/userContent.css" = {
      enable = true;
      source = "${ctp_zen}/themes/Mocha/Mauve/userContent.css";
    };
    ".zen/default/chrome/zen-logo-mocha.svg" = {
      enable = true;
      source = "${ctp_zen}/themes/Mocha/Mauve/zen-logo-mocha.svg";
    };
  };

  xdg.mimeApps =
    let
      value =
        let
          zen-browser = inputs.zen-browser.packages.${stdenv.hostPlatform.system}.${version}; # or twilight
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
