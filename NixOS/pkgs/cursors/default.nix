{
  stdenvNoCC,
  cursorName ? null,
}:

stdenvNoCC.mkDerivation {
  pname = "${cursorName}";
  version = "0-unstable-2025-12-30";

  src = ./cursors/${cursorName};

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/icons/${cursorName}
    cp -r ./* $out/share/icons/${cursorName}
    runHook postInstall
  '';

  meta = {
    description = "Cursor yayyy";
  };
}
