{
  stdenvNoCC,
  lib,
  fetchFromGitHub,
  catppuccin-whiskers,
  flavor ? "mocha",
  accent ? "mauve",
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "millenium-material-theme";
  version = "0-unstable-2026-02-17";

  srcs = [
    (fetchFromGitHub {
      owner = "kuska1";
      repo = "Material-Theme";
      rev = "b1aa00ec7250327fda88d2fa555fdd23164e0187";
      hash = "sha256-FJemv26E/tFcD7JIE5yVIp9W+t0K10TrMyVDz2fr06s=";
    })
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
    mkdir -p $out/share/Steam/steamui/skins
    cd ..
    cp -r source $out/share/Steam/steamui/skins/Material-Theme
  '';

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
