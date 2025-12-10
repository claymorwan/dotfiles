{ pkgs, inputs, system, ... }:

let
  version = "beta";
  # inherit version;
in
{
  # home.nix
  imports = [
    inputs.zen-browser.homeModules.${version}
    # or inputs.zen-browser.homeModules.twilight
    # or inputs.zen-browser.homeModules.twilight-official
  ];

  programs.zen-browser = {
    enable = true;

  #   profiles = {
  #     default = {
  #       id = 0;
  #       name = "default";
  #       isDefault = true;
  #       settings = {
  #         "widget.use-xdg-desktop-portal.file-picker" = 1;
  #         "zen.view.use-single-toolbar" = false;
  #         "zen.urlbar.replace-newtab" = false;
  #
  #       };
  #     };
  #     
  #   };
  # };

    policies = let
      mkLockedAttrs = builtins.mapAttrs (_: value: {
        Value = value;
        Status = "locked";
      });
    in
    {
      DisableAppUpdate = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      enablePlasmaBrowserIntegration = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      Preferences = mkLockedAttrs {
        "widget.use-xdg-desktop-portal.file-picker" = 1;
        # Sidebar and toolbar
        # "zen.view.use-single-toolbar" = false;
        # 
        # "zen.urlbar.replace-newtab" = false;
      };
    };
  };

  xdg.mimeApps = let
    value = let
      zen-browser = inputs.zen-browser.packages.${system}.${version}; # or twilight
    in
      zen-browser.meta.desktopFileName;

    associations = builtins.listToAttrs (map (name: {
        inherit name value;
      }) [
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
      ]);
  in {
    associations.added = associations;
    defaultApplications = associations;
  };

}
