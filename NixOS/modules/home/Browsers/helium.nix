{ inputs, pkgs, ... }:

{
  imports = [
    inputs.helium.homeModules.default
  ];

  programs.helium = {
    enable = true;

    commandLineArgs = [
      "--ozone-platform-hint=auto"
      "--enable-features=WaylandWindowDecorations"
      "--enable-wayland-ime=true"
    ];

    extensions = [
      { id = "clngdbkpkpeebahjckkjfobafhncgmne"; }
    ];

    nativeMessagingHosts = with pkgs; [
      kdePackages.plasma-browser-integration
    ];
  };
}
