{
  stdenvNoCC,
  millenium-material-theme-src,
  pkgs,
  local-utils ? import ../utils.nix { inherit pkgs; },
  lib,
  fetchFromGitHub,
  catppuccin-whiskers,
  nix-update-script,
  flavor ? "mocha",
  accent ? "mauve",
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "millenium-material-theme";
  version = "0-unstable-${local-utils.timestamp millenium-material-theme-src}";

  srcs = [
    millenium-material-theme-src
    ./files
  ];

  sourceRoot = ".";

  patches = [ ./files/skin.patch ];

  buildInputs = [
    catppuccin-whiskers
  ];

  prePatch = ''
    cd source
  '';

  buildPhase = ''
    whiskers ../files/theme.tera --flavor ${flavor}
    cp themes/${flavor}-latte/colors-${accent}.css css/main/colors/catppuccin.css
    rm -r themes
  '';

  installPhase = ''
    # mkdir -p $out/share/Steam/steamui/skins
    cd ..
    cp -r source $out #/share/Steam/steamui/skins/Material-Theme
  '';

  passthru.updateScript = nix-update-script { extraArgs = [ "--version=branch" ]; };

  meta = {
    description = "Material Theme for Steam Millenium";
    longDescription = ''
      My stupid solution to wanting the Material Theme but with a custom color scheme and reproducible.
      This might not be the best way to do this but idc brah it's just a local package.
    '';
    homepage = "https://steambrew.app/theme?id=ipYjqODds05KMcvh7QJn";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ claymorwan ];
  };
})
