{
  stdenvNoCC,
}:

stdenvNoCC.mkDerivation {
  pname = "zzz-font";
  version = "0-unstable-2026-08-24";

  src = ./zzz.ttf;

  dontUnpack = true;

  installPhase = ''
    runHook preInstall

    mkdir -p $out/share/fonts/truetype
    install -Dm644 $src $out/share/fonts/truetype/zzz.tff

    runHook postInstall
  '';
}
