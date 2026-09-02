{ inputs, pkgs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  home.packages = [
    inputs.fastpotify.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.spicetify = {
    enable = true;

    theme = spicePkgs.themes.catppuccin;
    colorScheme = "mocha";
    
    enabledExtensions = with spicePkgs.extensions; [
      catJamSynced
      beautifulLyrics
      # simpleBeautifulLyrics
      randomBadToTheBoneRiff
      # adblockify
      hidePodcasts
      # shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];

    enabledSnippets = with spicePkgs.snippets; [
      newHoverPanel
    ];
  };
}
