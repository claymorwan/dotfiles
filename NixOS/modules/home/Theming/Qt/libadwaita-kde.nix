# The kvantum theme is from a deleted repo, idk what happend, but i left the repo's remote in meta.homepage anyway
# I also left the license and readme in the theme's dir,  and removed extra folder i didn't needed, since he repo is gone

{
  lib,
  stdenvNoCC,
  ctp_flavor ? "mocha",
  ctp_accent ? "mauve",
}:

stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "libadwaita-kde-${ctp_flavor}-${ctp_accent}";
  version = "2-unstable-01-25";

  src = ./kvantum/Libadwaita-KDE/Kvantum;

  buildPhase = ''
    sh build.sh mocha mauve
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/Kvantum
    cp -a libadwaita-kde-${ctp_flavor}-${ctp_accent} $out/share/Kvantum
    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "https://gitlab.com/wawahai/Libadwaita-KDE";
    license = lib.licenses.gpl3Only;
  };
})
