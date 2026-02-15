{
  stdenv,
  fetchzip,
}:

stdenv.mkDerivation {
  pname = "No Continue";
  version = "0-unstable-2026-02-15";

  src = fetchzip {
    url = "https://gomarice.fuma-kotaro.com/gomarice_no_continue.zip";
    hash = "sha256-0QSWb2nXTWbRYzIVpUOBdoEBSC+PjwS+WojsA2VfGxw=";
  };

  dontConfigure = true;
  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm644 gomarice_no_continue.ttf -t $out/share/fonts/truetype

    runHook postInstall
  '';

  meta = {
    description = "No Continue font from Gomarice Font";
    homepage = "https://gomarice.fuma-kotaro.com/font_page_no_continue.html";
    # license = lib.licenses.; No idea what the license is brah
  };
}
