{ pkgs, inputs, ... }:

let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.spicetify
  ];

  programs.spicetify = {
    # enable = true;
    enabledExtensions = with spicePkgs.extensions; [
      catJamSynced
      beautifulLyrics
      # simpleBeautifulLyrics
      randomBadToTheBoneRiff
      # adblockify
      hidePodcasts
      # shuffle # shuffle+ (special characters are sanitized out of extension names)
    ];
    theme = spicePkgs.themes.text;
    colorScheme = "CatppuccinMocha";
  };
}
