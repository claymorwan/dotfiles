{
  pkgs,
  inputs,
  config,
  stdenv,
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

  home.file.".zen/default/chrome" = {
    enable = true;
    source = "${ctp_zen}/themes/Mocha/Mauve";
    recursive = true;
  };

  xdg.mimeApps =
    let
      value =
        let
          zen-browser = inputs.zen-browser.packages.${stdenv.hostPlatform.system}.${version};
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
